import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/ast/nodes/assign/AssignNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/background/BackgroundNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/binary/BinaryNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/bool/BoolNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/call/CallNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/character/CharacterNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/func/FuncNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/hide/HideNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/if/IfNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/jump/JumpNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/num/NumNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/pause/PauseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/play/PlayNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/player/PlayerNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/prog/ProgNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/return/ReturnNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/scene/SceneNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/show/ShowNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/speech/SpeechNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/str/StrNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/var/VarNode.dart';
import 'package:fquest_engine/engine/ast/interpreter/interruptService/InterruptService.dart';
import 'package:fquest_engine/engine/ast/interpreter/models/EvalResult.dart';
import 'package:fquest_engine/engine/scene/entities/CharacterEntity.dart';
import 'package:fquest_engine/engine/scene/entities/SceneEntity.dart';
import 'package:fquest_engine/engine/scene/entities/SpeechEntity.dart';
import 'package:fquest_engine/engine/scene/state/GSGlobalState.dart';
import 'package:fquest_engine/engine/services/animation/AnimationScheduler.dart';
import 'package:fquest_engine/engine/services/player/PlayerService.dart';
import 'package:fquest_engine/engine/story/Story.dart';

import '../../scene/state/GSState.dart';
import 'environment/Environment.dart';

class Interpreter {
  Interpreter({required this.ref, required this.context});

  WidgetRef ref;
  BuildContext context;

  InterruptService interruptService = InterruptService();

  preloadAssets(List<String> assets) async {
    for (var asset in assets) {
      precacheImage(AssetImage(asset), context);
    }
  }

  dynamic applyOperation(String op, dynamic a, dynamic b) {
    num(dynamic x) {
      if (x is double) {
        return x;
      }
      throw Exception('Expected number, but got $x');
    }

    div(dynamic x) {
      if (num(x) != 0) {
        return x;
      }
      throw Exception('Divide by zero');
    }

    switch (op) {
      case '+':
        return num(a) + num(b);
      case '-':
        return num(a) - num(b);
      case '*':
        return num(a) * num(b);
      case '/':
        return num(a) / div(b);
      case '%':
        return num(a) % div(b);
      case '&&':
        return a && b;
      case '||':
        return a || b;
      case '<':
        return num(a) < num(b);
      case '>':
        return num(a) > num(b);
      case '<=':
        return num(a) <= num(b);
      case '>=':
        return num(a) >= num(b);
      case '==':
        return a == b;
      case '!=':
        return a != b;
    }

    throw Exception('Unable to apply operator $op');
  }

  makeFunction(FuncNode node, Environment env) {
    return (List<dynamic> args) {
      final names = node.vars;
      final scope = env.extend();
      for (int i = 0; i < names.length; i++) {
        if (args[i] != null) {
          scope.def(names[i], args[i]);
        } else {
          throw Exception('Undefined value of variable "${names[i]}"');
        }
      }
      return eval(node.bodyNode, scope);
    };
  }

  Future<EvalResult> evalNext() async {
    final node = interruptService.getNextNode();

    if (node != null) {
      return eval(node.progNode, globalEnv, skipProgPushing: true);
    }
    return EvalResult(value: true);
  }

  Future<EvalResult> eval(BaseNode node, Environment env,
      {bool skipProgPushing = false}) async {
    switch (node.type) {
      case ENodeType.NUM:
        return EvalResult(value: (node as NumNode).value);
      case ENodeType.STR:
        return EvalResult(value: (node as StrNode).value);
      case ENodeType.BOOL:
        return EvalResult(value: (node as BoolNode).value);
      case ENodeType.VAR:
        return EvalResult(value: env.get((node as VarNode).value));
      case ENodeType.FUNC:
        return EvalResult(value: makeFunction(node as FuncNode, env));
      case ENodeType.CALL:
        final func = (await eval((node as CallNode).func, env)).value;
        List<dynamic> args = [];

        for (var v in node.args) {
          args.add((await eval(v, env)).value);
        }

        return EvalResult(value: func(args));
      case ENodeType.IF:
        final condition = await eval((node as IfNode).condNode, env);

        if (condition.isInterrupt) return condition;

        if (condition.value == true) {
          return eval(node.thenNode, env);
        } else if (node.elseNode != null) {
          return eval(node.elseNode!, env);
        }
        return EvalResult(value: false);
      case ENodeType.ASSIGN:
        if ((node as AssignNode).leftNode.type != ENodeType.VAR) {
          throw Exception('Cannot assign to ${node.leftNode.toJson()}');
        }
        return EvalResult(
            value: env.set((node.leftNode as VarNode).value,
                (await eval(node.rightNode, env)).value));
      case ENodeType.BINARY:
        return EvalResult(
            value: applyOperation(
                (node as BinaryNode).operator,
                (await eval(node.leftNode, env)).value,
                (await eval(node.rightNode, env)).value));
      case ENodeType.PROG:
        if (!skipProgPushing) {
          interruptService.progStack.push(node as ProgNode);
        }

        final progEntity = interruptService.getNextNode();

        if (progEntity != null) {
          if (progEntity.progNode.usedAssets.isNotEmpty) {
            preloadAssets(progEntity.progNode.usedAssets);
          }

          for (int i = progEntity.lastEvaluatedIndex + 1;
              i < progEntity.progNode.prog.length;
              i++) {
            progEntity.lastEvaluatedIndex = i;
            final res = await eval(progEntity.progNode.prog[i], env);
            if (res.isInterrupt) {
              return res;
            }
          }

          evalNext();
        }

        return EvalResult(value: true);
      case ENodeType.RETURN:
        return eval((node as ReturnNode).returnNode, env);
      case ENodeType.SCENE:
        ref
            .read(GSGlobalState.scenes.notifier)
            .set(SceneEntity.fromNode(node as SceneNode));

        return eval(node.prog, env);
      case ENodeType.BACKGROUND:
        ref.read(GSState.backgroundImageAssetPath.notifier).setBackground(
            (await eval((node as BackgroundNode).assetPath, env)).value);
        return EvalResult(value: true);
      case ENodeType.WAIT:
        return EvalResult(value: true, isInterrupt: true);
      case ENodeType.CHARACTER:
        final characterEntity = await CharacterEntity.fromNode(
            node as CharacterNode, (n) => eval(n, env));
        ref.read(GSState.characters.notifier).assign(characterEntity);
        return EvalResult(value: true);
      case ENodeType.SHOW:
        node as ShowNode;
        final characterEntity = ref
            .read(GSState.characters.notifier)
            .getAssigned(node.characterVarName);

        if (node.props.animation != null) {
          AnimationScheduler.scheduleAnimation(characterEntity, node.props.animation);
        }

        ref.read(GSState.characters.notifier).show(characterEntity, node);
        return EvalResult(value: true);
      case ENodeType.SPEECH:
        final speech = node as SpeechNode;
        ref.read(GSState.speech.notifier).set(await SpeechEntity.create(
            ref: ref,
            node: speech,
            eval: (BaseNode n) {
              return eval(n, env);
            }));
        return EvalResult(value: true, isInterrupt: true);
      case ENodeType.DIALOG_OPTION:
        return EvalResult(value: true);
      case ENodeType.ANCHOR:
        return EvalResult(value: true);
      case ENodeType.JUMP:
        final scenes = ref.read(Story.prog.notifier).state?.scenes;
        final label = (node as JumpNode).label;

        if (scenes != null && scenes.contains(label)) {
          final scene = await ref.read(Story.prog.notifier).loadScene(label);
          eval(scene, env);
        } else {
          interruptService.jumpToAnchor(label);
          evalNext();
        }

        return EvalResult(value: true, isInterrupt: true);
      case ENodeType.HIDE:
        node as HideNode;

        if (node.characterVarName == 'all') {
          ref.read(GSState.characters.notifier).hideAll();
        } else if (node.characterVarName == 'dialog') {
          ref.read(GSState.speech.notifier).set(null);
        } else {
          final characterEntity = ref
              .read(GSState.characters.notifier)
              .getAssigned(node.characterVarName);

          AnimationScheduler.broadcastAnimationEvent(characterEntity, node);
        }

        return EvalResult(value: true);
      case ENodeType.PLAYER:
        PlayerService.add(node as PlayerNode);
        return EvalResult(value: true);
      case ENodeType.PLAY:
        final playNode = node as PlayNode;
        final player = PlayerService.get(playNode.playerLabel);
        player?.play(playNode.assetPath);
        return EvalResult(value: true);
      case ENodeType.PAUSE:
        final player = PlayerService.get((node as PauseNode).playerLabel);
        player?.pause();
        return EvalResult(value: true);
    }
  }
}
