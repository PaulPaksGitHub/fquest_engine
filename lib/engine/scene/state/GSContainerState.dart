import 'package:flutter_riverpod/flutter_riverpod.dart';

class _CurrentSceneId extends StateNotifier<String?> {
  _CurrentSceneId() : super(null);

  set(String name) {
    state = name;
  }
}

class GSContainerState {
  static final currentSceneName =
      StateNotifierProvider<_CurrentSceneId, String?>((ref) {
    return _CurrentSceneId();
  });
}
