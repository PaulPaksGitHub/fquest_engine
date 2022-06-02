class AnimationScheduler {
  static final Map<dynamic, dynamic> _scheduledAnimations = {};

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