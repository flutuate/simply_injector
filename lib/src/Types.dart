import 'package:simply_injector/src/Container.dart';
import 'package:simply_injector/src/Scope.dart';
import 'package:simply_injector/src/simply_injector_core.dart';

// Internal helper methods on System.Type.
class Types
{
  static final List<Type> AmbiguousTypes = [ typeof<Type>(), typeof<String>(), typeof<Scope>(), typeof<Container>() ];

  static bool isAmbiguousType(Type type) => AmbiguousTypes.contains(type);
}

