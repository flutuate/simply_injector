import 'FinalClassException.dart';
import 'simply_injector_core.dart';

/// Ensures that the inherited class from it is not extended. Works at runtime.
class FinalClass<T> {
  FinalClass() {
    FinalClass.check<T>(this);
    /*if( runtimeType != typeof<T>() )  
      throw new FinalClassException<T>();*/
  }

  static void check<T>(dynamic instance) {
    if (instance.runtimeType != typeof<T>()) throw new FinalClassException<T>();
  }
}
