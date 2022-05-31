import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNodeConverter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CharacterNode.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterNode<T extends BaseNode> extends BaseNode {
  CharacterNode({this.name, this.assetPath, required this.varName}) : super(type: ENodeType.CHARACTER);

  String varName;
  @BaseNodeConverter()
  T? name;
  @BaseNodeConverter()
  T? assetPath;

  factory CharacterNode.fromJson(Map<String, dynamic> json) =>
      _$CharacterNodeFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterNodeToJson(this);
}