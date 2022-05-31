import 'package:fquest_engine/engine/scene/actions/models/GSActionModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'actions/GSAbstractActionParams.dart';

part 'GSModel.g.dart';

@JsonSerializable(explicitToJson: true)
class GSModel {
  GSModel({required this.label, required this.actions});

  String label;
  List<GSActionModel> actions;

  factory GSModel.fromJson(Map<String, dynamic> json) =>
      _$GSModelFromJson(json);

  Map<String, dynamic> toJson() => _$GSModelToJson(this);
}
