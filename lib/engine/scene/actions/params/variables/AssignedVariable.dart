
import 'ScopedVariable.dart';

class AssignedVariable extends ScopedVariable {
  AssignedVariable({required scope, required name, required this.value}) : super(scope: scope, name: name);

  dynamic value;

  static AssignedVariable fromScoped(ScopedVariable scopedVariable) {
    return AssignedVariable(scope: scopedVariable.scope, name: scopedVariable.name, value: null);
  }
}