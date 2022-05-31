import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:json_annotation/json_annotation.dart';
import '../models/GSActionModel.dart';

part 'GSDialogOption.g.dart';

@JsonSerializable(explicitToJson: true)
class GSDialogOption {
  GSDialogOption(
      {required this.title,
      required this.onSelectActions});

  String title;
  List<GSActionModel> onSelectActions;

  factory GSDialogOption.fromJson(Map<String, dynamic> json) =>
      _$GSDialogOptionFromJson(json);

  Map<String, dynamic> toJson() => _$GSDialogOptionToJson(this);
}
