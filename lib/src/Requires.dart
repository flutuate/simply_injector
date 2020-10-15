import 'file:///D:/projects/simply_injector/lib/src/exceptions/ArgumentException.dart';
import 'package:simply_injector/src/StringResources.dart';
import 'package:simply_injector/src/Types.dart';

/// Convenience class with common methods.
class Requires {
  static void isNotAnAmbiguousType(Type type, String paramName) {
    if (Types.isAmbiguousType(type)) {
      throw new ArgumentException(
          StringResources.typeIsAmbiguous(type), paramName);
    }
  }

  static void isNotNullOrEmpty(String instance, String paramName) {
    if (instance.isEmpty) {
      throw new ArgumentException("Value can not be empty.", paramName);
    }
  }
}
