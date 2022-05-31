import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/speech/SpeechNode.dart';
import 'package:fquest_engine/engine/scene/entities/CharacterEntity.dart';
import 'package:fquest_engine/engine/scene/entities/DialogOptionEntity.dart';
import 'package:fquest_engine/engine/scene/state/GSState.dart';

import '../../ast/interpreter/models/EvalResult.dart';

class SpeechEntity {
  late CharacterEntity character;
  late String text;

  List<DialogOptionEntity> dialogOptions;

  SpeechEntity(
      {required this.character, required this.text, this.dialogOptions = const []});

  static Future<SpeechEntity> create(
      {required WidgetRef ref, required SpeechNode node, required Future<EvalResult> Function(BaseNode) eval}) async {
    final character = ref
        .read(GSState.characters.notifier)
        .getAssigned(node.characterVarName);

    return SpeechEntity(
        character: character,
        text: (await eval(node.text)).value,
        dialogOptions: await DialogOptionEntity.create(ref, node, eval));
  }
}
