import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fquest_engine/engine/scene/actions/GSAbstractActionParams.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionDispatcher.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionResult.dart';
import 'package:fquest_engine/engine/scene/actions/GSActionType.dart';
import 'package:fquest_engine/engine/scene/actions/models/GSActionModel.dart';

abstract class GSActionRepository<T extends GSAbstractActionParams> {
  GSActionResult resultDispatched = GSActionResult(status: EActionStatus.DISPATCHED);

  GSActionType getType();

  Future<GSActionResult> launch(WidgetRef ref, GSActionModel<GSAbstractActionParams> action) async {
    return dispatch(ref, action.cast<T>());
  }

  Future<GSActionResult> dispatch(WidgetRef ref, GSActionModel<T> action);

  void connect() {
    // GSActionDispatcher.connectRepository(type: getType(), repository: this);
  }
}
