// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DefineAnchorAction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefineAnchorAction _$DefineAnchorActionFromJson(Map<String, dynamic> json) =>
    DefineAnchorAction(
      label: json['label'] as String,
      type: $enumDecode(_$GSActionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$DefineAnchorActionToJson(DefineAnchorAction instance) =>
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
