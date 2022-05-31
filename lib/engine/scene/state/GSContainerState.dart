import 'package:flutter_riverpod/flutter_riverpod.dart';

class _CurrentSceneId extends StateNotifier<String?> {
  _CurrentSceneId() : super(null);

  set(String name) {
    state = name;
  }
}

class _LabelToId extends StateNotifier<Map<String, int>> {
  _LabelToId() : super({'test': 0, 'characters': 1});
}

class GSContainerState {
  static final currentSceneName =
      StateNotifierProvider<_CurrentSceneId, String?>((ref) {
    return _CurrentSceneId();
  });

  static final labelsToId =
      StateNotifierProvider<_LabelToId, Map<String, int>>((ref) {
    return _LabelToId();
  });
}
