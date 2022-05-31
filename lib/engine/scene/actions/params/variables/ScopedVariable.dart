import '../../GSAbstractActionParams.dart';
import 'EVariableScope.dart';

class ScopedVariable {
  ScopedVariable({required this.scope, required this.name});

  EVariableScope scope;
  String name;
}