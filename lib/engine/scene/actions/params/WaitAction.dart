import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WaitAction.g.dart';

@JsonSerializable(explicitToJson: true)
class WaitAction extends GSAbstractActionParams {
  WaitAction({required GSActionType type}) : super(type: type);

  factory WaitAction.fromJson(Map<String, dynamic> json) =>
      _$WaitActionFromJson(json);

  Map<String, dynamic> toJson() => _$WaitActionToJson(this);
}