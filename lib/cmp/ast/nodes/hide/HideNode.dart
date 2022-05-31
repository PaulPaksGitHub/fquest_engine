import 'package:json_annotation/json_annotation.dart';

import '../base/BaseNode.dart';

part 'HideNode.g.dart';

@JsonSerializable(explicitToJson: true)
class HideNode extends BaseNode {
  String characterVarName;

  HideNode({required this.characterVarName}) : super(type: ENodeType.HIDE);

  factory HideNode.fromJson(Map<String, dynamic> json) =>
      _$HideNodeFromJson(json);

  Map<String, dynamic> toJson() => _$HideNodeToJson(this);
}