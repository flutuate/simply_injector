import 'package:simply_injector/src/ActivationException.dart';

import 'simply_injector_core.dart';
import 'Instance.dart';
import 'Lifestyle.dart';
import 'SingletonInstance.dart';
import 'TransientInstance.dart';
import 'TypeAlreadyRegisteredException.dart';
import 'FinalClass.dart';

class Container
extends FinalClass<Container>
{
  Container() {
    FinalClass.check<Container>(this);
  }

  void verify() {}

  @deprecated
  T getInstance<T>() {
    Type type = typeof<T>();
    Instance element = _elements[type];
    if( element == null )
      throw new ActivationException(type);
    return element.instance;
  }

  Map<Type, Instance> _elements = {};

  void unregister<T>() {
    _elements.remove(typeof<T>());
  }

  void register<T extends Object, C extends T>( New<C> creator, {Lifestyle lifestyle=Lifestyle.Transient} )
  {
    if( isPrimitive<T>() )
      throw
    Type type = typeof<T>();
    Instance element = _elements[type];
    if( element != null )
      throw new TypeAlreadyRegisteredException(type);
    switch( lifestyle ) {
      case Lifestyle.Singleton:
        _createSingletonInstance(type, creator());
        break;
      case Lifestyle.Transient:
        _createTransientInstance(type, creator);
        break;
      default:
    }
  }

  void _createSingletonInstance<C>( Type type, C instance ) {
    Instance element = new SingletonInstance(instance);
    _elements[type] = element;
  }

  void _createTransientInstance<C>( Type type, New<C> creator ) {
    Instance element = new TransientInstance(creator);
    _elements[type] = element;
  }

  T get<T>() => getInstance<T>();
}

bool isPrimitive<T>() {
  return T is bool || T is int || T is num || T is double || T is String;
}
