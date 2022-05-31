import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JumpAction.g.dart';

@JsonSerializable(explicitToJson: true)
class JumpAction extends GSAbstractActionParams {
  JumpAction({required GSActionType type, required this.label}) : super(type: type);

  String label;

  factory JumpAction.fromJson(Map<String, dynamic> json) =>
      _$JumpActionFromJson(json);

  Map<String, dynamic> toJson() => _$JumpActionToJson(this);
}