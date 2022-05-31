// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowCharacterAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCharacterAction _$ShowCharacterActionFromJson(Map<String, dynamic> json) =>
    ShowCharacterAction(
      type: $enumDecode(_$GSActionTypeEnumMap, json['type']),
      label: json['label'] as String,
      props: json['props'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ShowCharacterActionToJson(
        ShowCharacterAction instance) =>
    <String, dynamic>{
      'type': _$GSActionTypeEnumMap[instance.type],
      'label': instance.label,
      'props': instance.props,
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
