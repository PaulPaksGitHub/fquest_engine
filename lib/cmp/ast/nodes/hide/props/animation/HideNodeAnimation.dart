import 'package:json_annotation/json_annotation.dart';

part 'HideNodeAnimation.g.dart';

@JsonSerializable(explicitToJson: true)
class HideNodeAnimation {
  HideNodeAnimation();

  double? fadeOutDuration;

  factory HideNodeAnimation.fromJson(Map<String, dynamic> json) =>
      _$HideNodeAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$HideNodeAnimationToJson(this);
}