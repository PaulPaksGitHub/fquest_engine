class Environment {
  Environment({this.parent}) {
    vars = parent != null ? parent!.vars : {};
  }

  Environment? parent;
  Map<String, dynamic> vars = {};

  Environment extend(){
    return Environment(parent: this);
  }

  Environment? lookup(String key) {
    Environment? env = this;
    while (env != null) {
      if (env.vars.containsKey(key)) {
        return env;
      }
      env = env.parent;
    }
    return null;
  }

  dynamic get (String key) {
    if (vars.containsKey(key)) return vars[key];
    throw Exception('Undefined variable $key');
  }

  dynamic set (String key, dynamic value) {
    final scope = lookup(key);
    (scope ?? this).vars[key] = value;
    return value;
  }

  dynamic def (String key, dynamic value) {
    vars[key] = value;
    return value;
  }
}