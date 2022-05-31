import 'package:fquest_engine/cmp/ast/nodes/base/BaseNode.dart';
import 'package:fquest_engine/cmp/ast/nodes/base/BaseNodeConverter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DialogOptionNode.g.dart';

@JsonSerializable(explicitToJson: true)
class DialogOptionNode<T extends BaseNode> extends BaseNode {
  DialogOptionNode({required this.text, required this.onSelectProg})
      : super(type: ENodeType.DIALOG_OPTION);

  @BaseNodeConverter()
  T text;
  @BaseNodeConverter()
  T onSelectProg;

  factory DialogOptionNode.fromJson(Map<String, dynamic> json) =>
      _$DialogOptionNodeFromJson(json);

  Map<String, dynamic> toJson() => _$DialogOptionNodeToJson(this);
}
