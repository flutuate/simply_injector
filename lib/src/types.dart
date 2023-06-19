import 'container.dart';

/// Internal helper methods on System.Type.
class Types {
  static final List<Type> ambiguousTypes = [Type, String, Container];

  /// Returns `true` if [type] is a ambiguous type.
  static bool isAmbiguousType(Type type) => ambiguousTypes.contains(type);
}
