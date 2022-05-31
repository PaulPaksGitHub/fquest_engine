import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionDispatcher.dart';
import 'package:fquest_engine/engine/scene/actions/params/character/HideCharacterAction.dart';
import 'package:fquest_engine/engine/scene/entities/DialogOptionEntity.dart';
import 'package:fquest_engine/engine/scene/entities/SpeechEntity.dart';

import '../../character/Character.dart';
import '../entities/CharacterEntity.dart';
import '../../loaders/GSAssetLoader.dart';
import '../actions/GSActionResult.dart';
import '../actions/GSActionsProcessor.dart';
import '../actions/GSActionsTimeline.dart';
import '../actions/dialog/GSDialogOption.dart';
import '../actions/params/SpeechAction.dart';
import '../actions/params/assign/AssignCharacterAction.dart';
import '../actions/params/character/ShowCharacterAction.dart';
import 'GSGlobalState.dart';

class BackgroundImageAssetPath extends StateNotifier<String?> {
  BackgroundImageAssetPath() : super(null);

  void setBackground(String nextPath) => {state = nextPath};
}

class _ActionsProcessor extends StateNotifier<GSActionsProcessor> {
  _ActionsProcessor() : super(GSActionsProcessor());
}

class _Speech extends StateNotifier<SpeechEntity?> {
  _Speech() : super(null);

  void set(SpeechEntity speech) {
    state = speech;
  }
}

class _SceneName extends StateNotifier<String?> {
  _SceneName() : super(null);

  void setName( String name) {
    state = name;
  }
}

class LocalVariables extends StateNotifier<Map<String, dynamic>> {
  LocalVariables() : super({});

  void setVariable(String name, dynamic value) {
    state = {...state, name: value};
  }

  void clean() {
    state = {};
  }
}

class _LabelToTimelineIndex extends StateNotifier<Map<String, int>> {
  _LabelToTimelineIndex() : super({});

  setLabelIndex(String label, int index) {
    state = {...state, label: index};
  }
}

class _Characters extends StateNotifier<List<CharacterEntity>> {
  _Characters() : super([]);

  Map<String, CharacterEntity> assignedCharacters = {};

  void assign(CharacterEntity characterEntity) {
    assignedCharacters[characterEntity.characterNode.varName] = characterEntity;
  }

  CharacterEntity getAssigned(String label) {
    final character = assignedCharacters[label];

    if (character != null) {
      return character;
    }
    throw Exception('Character $label is\'n assigned');
  }

  void removeAll() {
    state = [];
  }

  Future hide(CharacterEntity characterEntity) async {
    int alreadyShownIndex = state.indexOf(characterEntity);

    if (alreadyShownIndex != -1) {
      state.removeAt(alreadyShownIndex);
    }
    state = [...state];
  }

  Future show(CharacterEntity characterEntity) async {
    hide(characterEntity);
    state.add(characterEntity);
    // Workaround
    state = [...state];
  }
}

class GSState {
  static final characters = StateNotifierProvider<_Characters, List<CharacterEntity>>((ref) {
    return _Characters();
  });

  static final localVariables =
      StateNotifierProvider<LocalVariables, Map<String, dynamic>>((ref) {
    return LocalVariables();
  });

  static final backgroundImageAssetPath =
      StateNotifierProvider<BackgroundImageAssetPath, String?>((ref) {
    return BackgroundImageAssetPath();
  });

  static final actionsProcessor =
      StateNotifierProvider<_ActionsProcessor, GSActionsProcessor>((ref) {
    return _ActionsProcessor();
  });

  static final speech = StateNotifierProvider<_Speech, SpeechEntity?>((ref) {
    return _Speech();
  });

  static final sceneName = StateNotifierProvider<_SceneName, String?>((ref) {
    return _SceneName();
  });

  static nextAction(BuildContext context, WidgetRef ref) async {
/*
    final timeline =
        ref.read(GSState.actionsProcessor.notifier).state.getTimeline();

    if (timeline != null) {
      final lastActivatedActionIndex = timeline.lastDispatchedIndex;
      final actions = timeline.actionsTimeline;

      for (var i = lastActivatedActionIndex + 1; i < actions.length; i++) {
        var currentAction = actions[i];
        print("Process Action index $i ${currentAction.actionType}");

        timeline.setLastDispatchedIndex(i);
        GSActionResult result = await GSActionDispatcher().dispatchAction(ref, currentAction);

        if (result.isInterrupt && result.status == EActionStatus.DISPATCHED) {
          if (result.launchNextRecursive) {
            nextAction(context, ref);
          }
          break;
        }
      }
    }
*/
  }

  static shouldUpdateScene(WidgetRef ref, String currentSceneName) {
    final sceneId = ref.read(GSState.sceneName.notifier).state;
    return (sceneId != null) ||
        sceneId != currentSceneName;
  }

  static onSelectDialogOption(
      BuildContext context, WidgetRef ref, DialogOptionEntity option) {

    option.wasSelected = true;
    ref.read(GSGlobalState.interpreter.notifier).state?.eval(option.onSelectProg, globalEnv);
  }
}
