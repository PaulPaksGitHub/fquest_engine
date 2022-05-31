import 'package:json_annotation/json_annotation.dart';

import '../../GSAbstractActionParams.dart';
import '../../GSActionType.dart';

part 'HideCharacterAction.g.dart';

@JsonSerializable(explicitToJson: true)
class HideCharacterAction extends GSAbstractActionParams {
  HideCharacterAction({required this.label, required GSActionType type})
      : super(type: type);

  String label;

  factory HideCharacterAction.fromJson(Map<String, dynamic> json) =>
      _$HideCharacterActionFromJson(json);

  Map<String, dynamic> toJson() => _$HideCharacterActionToJson(this);
}
