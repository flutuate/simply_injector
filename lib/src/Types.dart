import 'Container.dart';
import 'core.dart';

/// Internal helper methods on System.Type.
class Types {
  static final List<Type> AmbiguousTypes = [
    typeof<Type>(),
    typeof<String>(),
    typeof<Container>()
  ];

  static bool isAmbiguousType(Type type) => AmbiguousTypes.contains(type);
}
