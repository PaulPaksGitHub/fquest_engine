import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/models/GSActionModel.dart';
import 'package:fquest_engine/engine/scene/actions/params/JumpAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/SetBackgroundAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/SpeechAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/assign/AssignCharacterAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/character/HideCharacterAction.dart';
import 'package:fquest_engine/engine/scene/actions/params/character/ShowCharacterAction.dart';
import 'package:fquest_engine/engine/scene/actions/repositories/GSActionRepository.dart';
import 'package:fquest_engine/engine/scene/entities/SpeechEntity.dart';

import '../state/GSState.dart';
import 'GSActionResult.dart';
import 'GSActionType.dart';

class GSActionDispatcher {
/*
  static Map<GSActionType, GSActionRepository>  _repositories = {};

  static connectRepository ({required GSActionType type, required GSActionRepository repository}) {
    print('connect');
    if (_repositories[type] == null) {
      _repositories[type] = repository;
    } else {
      throw Exception('GSActionDispatcher [connectRepository]: Repository for type "$type" is already exists');
    }
  }

  prepareAssets(BuildContext context, WidgetRef ref, GSActionModel action) {
    // TODO
  }

  Future<GSActionResult> dispatchAction(
      WidgetRef ref, GSActionModel action) async {
*/
/*e    final repository = _repositories[action.actionType];

    if (repository != null) {
      return repository.launch(ref, action);
    }

    throw Exception('GSActionDispatcher [dispatchAction]: Repository for type "${action.actionType}" not found');*//*



    final actionType = action.actionType;
    final params = action.params;
    bool isInterrupt = actionType == GSActionType.SPEECH ||
        actionType == GSActionType.WAIT ||
        actionType == GSActionType.JUMP;
    bool launchNextRecursive = actionType == GSActionType.JUMP;

*/
/*    if (condition != null && !condition!.dispatch(ref)) {
      return GSActionResult(status: EActionStatus.SKIPPED, isInterrupt: isInterrupt);
    }*//*


    switch (actionType) {
      case GSActionType.SET_BACKGROUND:
        ref.read(GSState.backgroundImageAssetPath.notifier).setBackground(
            (params as SetBackgroundAction).newBackgroundAssetPath);
        break;
      case GSActionType.INIT_SCENE:
        // ref.read(GSState.sceneName.notifier).setName(action.id);
        break;
      case GSActionType.SPEECH:
        final speechEntity = await SpeechEntity.create(
            ref: ref, action: action.params as SpeechAction);
        ref.read(GSState.speech.notifier).set(speechEntity);
        break;
      case GSActionType.ASSIGN_VARIABLE_VALUE:
        // TODO
        break;
      case GSActionType.SOUND:
        // TODO: Handle this case.
        break;
      case GSActionType.DEFINE_ANCHOR:
        break;
      case GSActionType.JUMP:
        if (ref
            .read(GSState.actionsProcessor.notifier)
            .state
            .hasAnchorInContext((params as JumpAction).label)) {
          ref
              .read(GSState.actionsProcessor.notifier)
              .state
              .jumpToAnchor((params as JumpAction).label);
        } else {
          // TODO JUMP TO SCENE
        }
        break;
      case GSActionType.WAIT:
        // TODO: Handle this case.
        break;
      case GSActionType.ASSIGN_CHARACTER:
        ref
            .read(GSState.characters.notifier)
            .assign(action.params as AssignCharacterAction);
        break;
      case GSActionType.SHOW_CHARACTER:
        ref
            .read(GSState.characters.notifier)
            .show(action.params as ShowCharacterAction);
        break;
      case GSActionType.HIDE_CHARACTER:
        ref
            .read(GSState.characters.notifier)
            .hide(action.params as HideCharacterAction);
        break;
    }

    return GSActionResult(
        status: EActionStatus.DISPATCHED,
        isInterrupt: isInterrupt,
        launchNextRecursive: launchNextRecursive);
  }
*/
}
