
import 'package:fquest_engine/engine/scene/actions/params/DefineAnchorAction.dart';

import 'models/GSActionModel.dart';
import 'GSActionType.dart';

class GSActionsTimeline {
  GSActionsTimeline({this.actionsTimeline = const [], this.lastDispatchedIndex = -1});

  List<GSActionModel> actionsTimeline;
  int lastDispatchedIndex;

  void setActions(List<GSActionModel> actions) {
    actionsTimeline = actions;
  }

  void setLastDispatchedIndex(int index) {
    lastDispatchedIndex = index;
  }

  bool _isAnchorsCached = false;
  Map<String, int> _labelToIndex = {};

  int  findAnchorIndex (String anchor) {
    if (!_isAnchorsCached) {
      for (int i = 0; i < actionsTimeline.length; i++) {
        if (actionsTimeline[i].actionType == GSActionType.DEFINE_ANCHOR) {
          _labelToIndex[(actionsTimeline[i].params as DefineAnchorAction).label] = i;
        }
      }
    }

    final labelIndex = _labelToIndex[anchor];

    if (labelIndex == null) {
      return -1;
    }
    return labelIndex;
  }
}