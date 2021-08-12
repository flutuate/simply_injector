import 'package:simply_injector/src/StringResources.dart';
import 'package:simply_injector/src/Types.dart';

/// Convenience class with common methods.
class Requires {
  static void isNotAnAmbiguousType(Type type, String paramName) {
    if (Types.isAmbiguousType(type)) {
      final message = '${StringResources.typeIsAmbiguous(type)}\n'
          'Parameter name: $paramName';
      throw ArgumentError(message);
    }
  }
}
