import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/dialog/option/DialogOptionNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/speech/SpeechNode.dart';
import 'package:fquest_engine/engine/ast/interpreter/models/EvalResult.dart';

import '../actions/models/GSActionModel.dart';

class DialogOptionEntity {
  DialogOptionEntity(
      {required this.title, required this.onSelectProg, this.onceAvailable});

  String title;
  BaseNode onSelectProg;

  bool? onceAvailable;
  bool wasSelected = false;

  static Future<List<DialogOptionEntity>> create(
      WidgetRef ref, SpeechNode node, Future<EvalResult> Function(BaseNode) eval) async {
    List<DialogOptionEntity> options = [];
    for (var option in node.dialogOptions) {
      options.add(DialogOptionEntity(title: (await eval((option as DialogOptionNode).text)).value, onSelectProg: option.onSelectProg));
    }
    return options;
  }
}
