
import 'package:fquest_engine/engine/character/Position.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ShowNodeProps.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowNodeProps {
  Position? position;

  ShowNodeProps();

  factory ShowNodeProps.fromJson(Map<String, dynamic> json) =>
      _$ShowNodePropsFromJson(json);

  Map<String, dynamic> toJson() => _$ShowNodePropsToJson(this);
}