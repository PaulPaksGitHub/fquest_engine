import 'package:json_annotation/json_annotation.dart';

import '../GSAbstractActionParams.dart';
import '../GSActionType.dart';

part 'DefineAnchorAction.g.dart';

@JsonSerializable(explicitToJson: true)
class DefineAnchorAction extends GSAbstractActionParams {
  DefineAnchorAction({required this.label, required GSActionType type}): super(type: type);

  String label;

  factory DefineAnchorAction.fromJson(Map<String, dynamic> json) =>
      _$DefineAnchorActionFromJson(json);

  Map<String, dynamic> toJson() => _$DefineAnchorActionToJson(this);
}