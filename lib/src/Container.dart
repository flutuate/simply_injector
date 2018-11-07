import 'simply_injector_core.dart';
import 'Instance.dart';
import 'Lifestyle.dart';
import 'SingletonInstance.dart';
import 'TransientInstance.dart';
import 'ClassAlreadyRegistered.dart';
import 'FinalClass.dart';

class Container
extends FinalClass<Container>
{
  Container() {
    FinalClass.check<Container>(this);
  }

  void verify() {}

  T getInstance<T>() {
    Type type = typeOf<T>();
    Instance element = _elements[type];
    if( element == null )
      throw new Exception('TODO element == null');
    return element.instance;
  }

  Map<Type, Instance> _elements = {};

  void unregister<T>() {
    _elements.remove(typeOf<T>());
  }

  void register<T, C extends T>( New<C> creator, {Lifestyle lifestyle=Lifestyle.Transient} )
  {
    Type type = typeOf<T>();
    Instance element = _elements[type];
    if( element != null )
      throw new ClassAlreadyRegistered(type);
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
