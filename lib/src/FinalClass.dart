import 'simply_injector_core.dart';
import 'FinalClassException.dart';

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
