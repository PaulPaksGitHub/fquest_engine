
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:json_annotation/json_annotation.dart';

import '../GSAbstractActionParams.dart';

part 'SetBackgroundAction.g.dart';

@JsonSerializable(explicitToJson: true)
class SetBackgroundAction extends GSAbstractActionParams {
  SetBackgroundAction({required this.newBackgroundAssetPath, required GSActionType type}) : super(type: type);

  String newBackgroundAssetPath;

  factory SetBackgroundAction.fromJson(Map<String, dynamic> json) =>
      _$SetBackgroundActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetBackgroundActionToJson(this);
}