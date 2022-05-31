// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssignCharacterAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignCharacterAction _$AssignCharacterActionFromJson(
        Map<String, dynamic> json) =>
    AssignCharacterAction(
      label: json['label'] as String,
      character: Character.fromJson(json['character'] as Map<String, dynamic>),
      type: $enumDecode(_$GSActionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AssignCharacterActionToJson(
        AssignCharacterAction instance) =>
    <String, dynamic>{
      'type': _$GSActionTypeEnumMap[instance.type],
      'label': instance.label,
      'character': instance.character.toJson(),
    };

const _$GSActionTypeEnumMap = {
  GSActionType.INIT_SCENE: 'INIT_SCENE',
  GSActionType.SPEECH: 'SPEECH',
  GSActionType.ASSIGN_VARIABLE_VALUE: 'ASSIGN_VARIABLE_VALUE',
  GSActionType.SOUND: 'SOUND',
  GSActionType.SET_BACKGROUND: 'SET_BACKGROUND',
  GSActionType.DEFINE_ANCHOR: 'DEFINE_ANCHOR',
  GSActionType.JUMP: 'JUMP',
  GSActionType.WAIT: 'WAIT',
  GSActionType.ASSIGN_CHARACTER: 'ASSIGN_CHARACTER',
  GSActionType.SHOW_CHARACTER: 'SHOW_CHARACTER',
  GSActionType.HIDE_CHARACTER: 'HIDE_CHARACTER',
};
