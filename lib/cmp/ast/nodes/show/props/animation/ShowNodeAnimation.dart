
import 'package:json_annotation/json_annotation.dart';

part 'ShowNodeAnimation.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowNodeAnimation {
  ShowNodeAnimation();

  double? fadeInDuration;

  factory ShowNodeAnimation.fromJson(Map<String, dynamic> json) =>
      _$ShowNodeAnimationFromJson(json);

  Map<String, dynamic> toJson() => _$ShowNodeAnimationToJson(this);
}