import 'Container.dart';
import 'core.dart';

/// Internal helper methods on System.Type.
class Types {
  static final List<Type> AmbiguousTypes = [
    typeof<Type>(),
    typeof<String>(),
    typeof<Container>()
  ];

  /// Returns [true] if [type] is a ambiguous type.
  static bool isAmbiguousType(Type type) => AmbiguousTypes.contains(type);
}
