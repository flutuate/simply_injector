import 'package:simply_injector/src/ArgumentException.dart';
import 'package:simply_injector/src/StringResources.dart';
import 'package:simply_injector/src/Types.dart';

class Requires
{
  static void isNotAnAmbiguousType(Type type, String paramName) {
    if (Types.isAmbiguousType(type))
    {
      throw new ArgumentException(StringResources.typeIsAmbiguous(type), paramName);
    }
  }

  static void IsNotNull(Object instance, String paramName) {
    if( instance == null )
      throwArgumentNullException(paramName);
  }

  static void throwArgumentNullException(String paramName) {
    throw new ArgumentError.notNull(paramName);
  }
}