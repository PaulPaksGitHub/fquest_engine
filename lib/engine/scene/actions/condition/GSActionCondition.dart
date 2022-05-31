import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/GSState.dart';
import '../params/variables/AssignedVariable.dart';
import '../params/variables/EVariableScope.dart';
import '../params/variables/ScopedVariable.dart';

enum EConditionOperation {
  EQ,
}

class GSActionCondition {
  GSActionCondition({required this.v1, required this.v2, required this.operation});

  ScopedVariable v1;
  ScopedVariable v2;
  EConditionOperation operation;

  AssignedVariable _v1 = AssignedVariable(scope: EVariableScope.TEMPORARY, name: '', value: 0);
  AssignedVariable _v2 = AssignedVariable(scope: EVariableScope.TEMPORARY, name: '', value: 0);

  AssignedVariable assignValue(WidgetRef ref, ScopedVariable v) {
    AssignedVariable action;

    if (v.scope == EVariableScope.LOCAL) {
      action = AssignedVariable.fromScoped(v);
      action.value = ref.read(GSState.localVariables.notifier).state[v.name];
    } else {
      action = v as AssignedVariable;
    }

    return action;
  }

  bool dispatch(WidgetRef ref) {
    _v1 = assignValue(ref, v1);
    _v2 = assignValue(ref, v2);

    switch (operation) {
      case EConditionOperation.EQ:
        return _eq();
    }

    return false;
  }

  bool _eq() {
    return _v1.value == _v2.value;
  }
}
