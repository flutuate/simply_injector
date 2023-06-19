import 'package:simply_injector/src/string_resources.dart';
import 'package:simply_injector/src/types.dart';

/// Convenience class with common methods.
sealed class Requires {
  static void isNotAnAmbiguousType(Type type, String paramName) {
    if (Types.isAmbiguousType(type)) {
      final message = '${StringResources.typeIsAmbiguous(type)}\n'
          'Parameter name: $paramName';
      throw ArgumentError(message);
    }
  }
}
