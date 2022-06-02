import 'package:fquest_engine/cmp/streams/UuidStream.dart';


class AnimationScheduler {
  static final Map<dynamic, dynamic> _scheduledAnimations = {};

  static final UuidStream _listenersUuid = UuidStream();
  static final Map<dynamic, Map<int, Function(dynamic value)>> _listeners = {};

  static Function() addListener (dynamic key, Function(dynamic value) cb) {
    final id = _listenersUuid.next();

    _listeners[key] = {
      ...(_listeners[key] ?? {}),
      id: cb
    };

    return () {
      _listeners[key]?.remove(id);
    };
  }

  static broadcastAnimationEvent(dynamic key, dynamic value) {
    final listeners = _listeners[key];
    if (listeners != null && listeners.keys.isNotEmpty) {
      for (var listener in listeners.values) {
        listener(value);
      }
    }
  }

  static scheduleAnimation (dynamic key, dynamic config) {
    _scheduledAnimations[key] = config;
  }

  static dynamic getAnimation(dynamic key) {
    final value = _scheduledAnimations[key];

    if (_scheduledAnimations.containsKey(key)) {
      _scheduledAnimations.remove(key);
    }

    return value;
  }
}