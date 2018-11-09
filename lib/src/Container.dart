import 'package:simply_injector/src/ActivationException.dart';
import 'package:simply_injector/src/Requires.dart';

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

  // TODO change method's name
  void registerService<TService>( New<TService> creator, {Lifestyle lifestyle=Lifestyle.Transient} )
    => register<TService, TService>(creator, lifestyle: lifestyle);

  void register<TService, TImplementation extends TService>( New<TImplementation> creator, {Lifestyle lifestyle=Lifestyle.Transient} )
  {
    Requires.IsNotNull(creator, 'creator');
    Requires.isNotAnAmbiguousType(TService, 'TService');

    Type type = typeof<TService>();
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

  void registerInstance<TService>( New<TService> creator ) => register<TService, TService>(creator, lifestyle: Lifestyle.Singleton);

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

