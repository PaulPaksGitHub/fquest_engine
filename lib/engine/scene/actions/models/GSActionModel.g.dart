// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GSActionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSActionModel<T> _$GSActionModelFromJson<T extends GSAbstractActionParams>(
        Map<String, dynamic> json) =>
    GSActionModel<T>(
      id: json['id'] as int,
      actionType: $enumDecode(_$GSActionTypeEnumMap, json['actionType']),
      params: _ActionsConverter<T>().fromJson(json['params']),
    );

Map<String, dynamic> _$GSActionModelToJson<T extends GSAbstractActionParams>(
        GSActionModel<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actionType': _$GSActionTypeEnumMap[instance.actionType],
      'params': _ActionsConverter<T>().toJson(instance.params),
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
