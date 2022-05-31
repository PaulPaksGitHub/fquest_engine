import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

import '../GSAbstractActionParams.dart';

part 'InitSceneAction.g.dart';

@JsonSerializable(explicitToJson: true)
class InitSceneAction extends GSAbstractActionParams {
  InitSceneAction({required this.label, required GSActionType type}) : super(type: type);

  String label;

  factory InitSceneAction.fromJson(Map<String, dynamic> json) =>
      _$InitSceneActionFromJson(json);

  Map<String, dynamic> toJson() => _$InitSceneActionToJson(this);
}