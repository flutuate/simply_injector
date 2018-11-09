import 'package:simply_injector/src/ArgumentException.dart';
import 'package:simply_injector/src/StringResources.dart';
import 'package:simply_injector/src/Types.dart';
import 'package:simply_injector/src/simply_injector_core.dart';

class Requires
{
  static void isNotAnAmbiguousType(Type type, String paramName) {
    if (Types.isAmbiguousType(type))
    {
      throw new ArgumentException(StringResources.typeIsAmbiguous(type), paramName);
    }
  }

  static void IsNotNull(New creator, String paramName) {
      if( creator == null )
        throwArgumentNullException(paramName);
  }

  static void throwArgumentNullException(String paramName) {
    throw new ArgumentError.notNull(paramName);
  }
}