import 'package:json_annotation/json_annotation.dart';

import '../../GSAbstractActionParams.dart';
import '../../GSActionType.dart';

part 'ShowCharacterAction.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowCharacterAction extends GSAbstractActionParams {
  String label;
  Map<String, dynamic>? props;

  ShowCharacterAction({required GSActionType type, required this.label, this.props}) : super(type: type);

  factory ShowCharacterAction.fromJson(Map<String, dynamic> json) =>
      _$ShowCharacterActionFromJson(json);

  Map<String, dynamic> toJson() => _$ShowCharacterActionToJson(this);
}
