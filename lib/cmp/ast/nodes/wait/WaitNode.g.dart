// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WaitNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaitNode _$WaitNodeFromJson(Map<String, dynamic> json) =>
    WaitNode()..type = $enumDecode(_$ENodeTypeEnumMap, json['type']);

Map<String, dynamic> _$WaitNodeToJson(WaitNode instance) => <String, dynamic>{
      'type': _$ENodeTypeEnumMap[instance.type],
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
  ENodeType.PLAYER: 'PLAYER',
  ENodeType.PLAY: 'PLAY',
  ENodeType.PAUSE: 'PAUSE',
};
