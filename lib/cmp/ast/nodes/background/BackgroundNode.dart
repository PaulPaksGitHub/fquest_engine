import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNodeConverter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BackgroundNode.g.dart';

@JsonSerializable(explicitToJson: true)
class BackgroundNode<T extends BaseNode> extends BaseNode {
  BackgroundNode({required this.assetPath}) : super(type: ENodeType.BACKGROUND);

  @BaseNodeConverter()
  T assetPath;

  factory BackgroundNode.fromJson(Map<String, dynamic> json) =>
      _$BackgroundNodeFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundNodeToJson(this);
}