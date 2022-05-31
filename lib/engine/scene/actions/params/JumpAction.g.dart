// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JumpAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JumpAction _$JumpActionFromJson(Map<String, dynamic> json) => JumpAction(
      type: $enumDecode(_$GSActionTypeEnumMap, json['type']),
      label: json['label'] as String,
    );

Map<String, dynamic> _$JumpActionToJson(JumpAction instance) =>
    <String, dynamic>{
      'type': _$GSActionTypeEnumMap[instance.type],
      'label': instance.label,
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
