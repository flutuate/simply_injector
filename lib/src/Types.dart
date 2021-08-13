import 'Container.dart';

/// Internal helper methods on System.Type.
class Types {
  static final List<Type> AmbiguousTypes = [Type, String, Container];

  /// Returns [true] if [type] is a ambiguous type.
  static bool isAmbiguousType(Type type) => AmbiguousTypes.contains(type);
}
