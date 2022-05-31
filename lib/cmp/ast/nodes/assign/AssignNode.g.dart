// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssignNode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignNode<T> _$AssignNodeFromJson<T extends BaseNode>(
        Map<String, dynamic> json) =>
    AssignNode<T>(
      leftNode: BaseNodeConverter<T>().fromJson(json['leftNode']),
      rightNode: BaseNodeConverter<T>().fromJson(json['rightNode']),
    )..type = $enumDecode(_$ENodeTypeEnumMap, json['type']);

Map<String, dynamic> _$AssignNodeToJson<T extends BaseNode>(
        AssignNode<T> instance) =>
    <String, dynamic>{
      'type': _$ENodeTypeEnumMap[instance.type],
      'leftNode': BaseNodeConverter<T>().toJson(instance.leftNode),
      'rightNode': BaseNodeConverter<T>().toJson(instance.rightNode),
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
