import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

import '../GSAbstractActionParams.dart';
import '../dialog/GSDialogOption.dart';

part 'SpeechAction.g.dart';

@JsonSerializable(explicitToJson: true)
class SpeechAction extends GSAbstractActionParams {
  SpeechAction(
      {required this.characterLabel,
      required this.text,
      this.dialogOptions,
      required GSActionType type})
      : super(type: type);

  String characterLabel;
  String text;

  List<GSDialogOption>? dialogOptions;

  factory SpeechAction.fromJson(Map<String, dynamic> json) =>
      _$SpeechActionFromJson(json);

  Map<String, dynamic> toJson() => _$SpeechActionToJson(this);
}
