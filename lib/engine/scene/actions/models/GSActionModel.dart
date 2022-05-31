import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/params/DefineAnchorAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/JumpAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/SpeechAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/WaitAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/assign/AssignCharacterAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/character/HideCharacterAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/character/ShowCharacterAction.dart';
import 'package:json_annotation/json_annotation.dart';

import '../GSActionType.dart';
import '../init/InitSceneAction.dart';
import '../params/SetBackgroundAction.dart';

part 'GSActionModel.g.dart';

@JsonSerializable(explicitToJson: true)
class GSActionModel<T extends GSAbstractActionParams> {
  GSActionModel(
      {required this.id, required this.actionType, required this.params});

  int id;
  GSActionType actionType;
  @_ActionsConverter()
  T params;

  GSActionModel<P> cast <P extends T> () {
    return GSActionModel(id: id, actionType: actionType, params: params as P);
  }

  factory GSActionModel.fromJson(Map<String, dynamic> json) =>
      _$GSActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GSActionModelToJson(this);
}

class _ActionsConverter<T> implements JsonConverter<T, Object?> {
  const _ActionsConverter();

  static const Map<String, GSActionType> mappedActions = {
    'INIT_SCENE': GSActionType.INIT_SCENE,
    'SET_BACKGROUND': GSActionType.SET_BACKGROUND,
    'ASSIGN_CHARACTER': GSActionType.ASSIGN_CHARACTER,
    'SHOW_CHARACTER': GSActionType.SHOW_CHARACTER,
    'WAIT': GSActionType.WAIT,
    'SPEECH': GSActionType.SPEECH,
    'HIDE_CHARACTER': GSActionType.HIDE_CHARACTER,
    'DEFINE_ANCHOR': GSActionType.DEFINE_ANCHOR,
    'JUMP': GSActionType.JUMP,
  };

  @override
  fromJson(Object? json) {
    if (json is Map<String, dynamic> && json.containsKey('type')) {
      switch (mappedActions[json['type']]) {
        case GSActionType.INIT_SCENE:
          return InitSceneAction.fromJson(json) as T;
        case GSActionType.SPEECH:
          return SpeechAction.fromJson(json) as T;
          break;
        case GSActionType.ASSIGN_VARIABLE_VALUE:
          // TODO: Handle this case.
          break;
        case GSActionType.SOUND:
          // TODO: Handle this case.
          break;
        case GSActionType.SET_BACKGROUND:
          return SetBackgroundAction.fromJson(json) as T;
        case GSActionType.DEFINE_ANCHOR:
          return DefineAnchorAction.fromJson(json) as T;
        case GSActionType.JUMP:
          return JumpAction.fromJson(json) as T;
        case GSActionType.WAIT:
          return WaitAction.fromJson(json) as T;
        case GSActionType.ASSIGN_CHARACTER:
          return AssignCharacterAction.fromJson(json) as T;
        case GSActionType.SHOW_CHARACTER:
          return ShowCharacterAction.fromJson(json) as T;
        case GSActionType.HIDE_CHARACTER:
          return HideCharacterAction.fromJson(json) as T;
      }
    }

    throw Exception('Unable to deserialize action: $json');
  }

  @override
  Object? toJson(T object) => object;
}
