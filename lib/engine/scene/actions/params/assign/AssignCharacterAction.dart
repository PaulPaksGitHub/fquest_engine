import 'package:fquest_engine/engine/character/Character.dart';
import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AssignCharacterAction.g.dart';

@JsonSerializable(explicitToJson: true)
class AssignCharacterAction extends GSAbstractActionParams {
  AssignCharacterAction({required this.label, required this.character, required GSActionType type}) : super(type: type);

  String label;
  Character character;

  factory AssignCharacterAction.fromJson(Map<String, dynamic> json) =>
      _$AssignCharacterActionFromJson(json);

  Map<String, dynamic> toJson() => _$AssignCharacterActionToJson(this);
}