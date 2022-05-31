
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GSAbstractActionParams.g.dart';

@JsonSerializable(explicitToJson: true)
class GSAbstractActionParams {
  GSAbstractActionParams({required this.type});

  GSActionType type;

  factory GSAbstractActionParams.fromJson(Map<String, dynamic> json) =>
      _$GSAbstractActionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GSAbstractActionParamsToJson(this);
}
