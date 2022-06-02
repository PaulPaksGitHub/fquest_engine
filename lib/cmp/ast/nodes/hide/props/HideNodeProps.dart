import 'package:fquest_engine/cmp/ast/nodes/hide/props/animation/HideNodeAnimation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'HideNodeProps.g.dart';

@JsonSerializable(explicitToJson: true)
class HideNodeProps {
  HideNodeProps();

  HideNodeAnimation? animation;

  factory HideNodeProps.fromJson(Map<String, dynamic> json) =>
      _$HideNodePropsFromJson(json);

  Map<String, dynamic> toJson() => _$HideNodePropsToJson(this);
}