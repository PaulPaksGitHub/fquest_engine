import 'package:json_annotation/json_annotation.dart';

import '../base/BaseNode.dart';
import 'props/HideNodeProps.dart';

part 'HideNode.g.dart';

@JsonSerializable(explicitToJson: true)
class HideNode extends BaseNode {
  String characterVarName;
  HideNodeProps props;

  HideNode({required this.characterVarName, required this.props}) : super(type: ENodeType.HIDE);

  factory HideNode.fromJson(Map<String, dynamic> json) =>
      _$HideNodeFromJson(json);

  Map<String, dynamic> toJson() => _$HideNodeToJson(this);
}