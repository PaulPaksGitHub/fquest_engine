// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpeechNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeechNode<T> _$SpeechNodeFromJson<T extends BaseNode>(
        Map<String, dynamic> json) =>
    SpeechNode<T>(
      characterVarName: json['characterVarName'] as String,
      text: BaseNodeConverter<T>().fromJson(json['text']),
      dialogOptions: (json['dialogOptions'] as List<dynamic>?)
              ?.map(BaseNodeConverter<T>().fromJson)
              .toList() ??
          const [],
    )..type = $enumDecode(_$ENodeTypeEnumMap, json['type']);

Map<String, dynamic> _$SpeechNodeToJson<T extends BaseNode>(
        SpeechNode<T> instance) =>
    <String, dynamic>{
      'type': _$ENodeTypeEnumMap[instance.type],
      'characterVarName': instance.characterVarName,
      'text': BaseNodeConverter<T>().toJson(instance.text),
      'dialogOptions':
          instance.dialogOptions.map(BaseNodeConverter<T>().toJson).toList(),
    };

const _$ENodeTypeEnumMap = {
  ENodeType.NUM: 'NUM',
  ENodeType.STR: 'STR',
  ENodeType.BOOL: 'BOOL',
  ENodeType.VAR: 'VAR',
  ENodeType.FUNC: 'FUNC',
  ENodeType.CALL: 'CALL',
  ENodeType.IF: 'IF',
  ENodeType.ASSIGN: 'ASSIGN',
  ENodeType.BINARY: 'BINARY',
  ENodeType.PROG: 'PROG',
  ENodeType.RETURN: 'RETURN',
  ENodeType.SCENE: 'SCENE',
  ENodeType.WAIT: 'WAIT',
  ENodeType.BACKGROUND: 'BACKGROUND',
  ENodeType.CHARACTER: 'CHARACTER',
  ENodeType.SHOW: 'SHOW',
  ENodeType.HIDE: 'HIDE',
  ENodeType.SPEECH: 'SPEECH',
  ENodeType.DIALOG_OPTION: 'DIALOG_OPTION',
  ENodeType.ANCHOR: 'ANCHOR',
  ENodeType.JUMP: 'JUMP',
};
