import 'GSActionsTimeline.dart';

class GSActionsProcessor {
  List<GSActionsTimeline> _actionsStack = [];

  GSActionsTimeline? getTimeline() {
    if (_actionsStack.isNotEmpty) {
      final timeline = _actionsStack[0];
      if (timeline.actionsTimeline.length - 1 == timeline.lastDispatchedIndex) {
        finishCurrentTimeline();
        return getTimeline();
      }
      return timeline;
    }
    return null;
  }

  bool hasAnchorInContext (String anchor) {
    for (var timeline in _actionsStack) {
      if (timeline.findAnchorIndex(anchor) != -1) {
        return true;
      }
    }
    return false;
  }

  void jumpToAnchor(String anchor) {
    final timeline = _actionsStack[0];

    if (timeline != null) {
      final labelIndex = timeline.findAnchorIndex(anchor);

      if (labelIndex != -1) {
        timeline.setLastDispatchedIndex(labelIndex);
      } else {
        finishCurrentTimeline();
        jumpToAnchor(anchor);
      }
    } else {
      print("LABEL NOT FOUND: " + anchor);
    }
  }

  void addTimeline(GSActionsTimeline timeline) {
    _actionsStack.insert(0, timeline);
    // print('Add ${_actionsStack.length}');
  }

  void finishCurrentTimeline() {
    _actionsStack.removeAt(0);
    // print('Remove ${_actionsStack.length}');
  }
}