import 'package:meta/meta.dart';
import 'package:simply_injector/src/ActivationException.dart';
import 'package:simply_injector/src/ContainerOptions.dart';
import 'package:simply_injector/src/InstanceProducer.dart';
import 'package:simply_injector/src/Requires.dart';

import 'FinalClass.dart';
import 'Lifestyle.dart';
import 'simply_injector_core.dart';

part 'Container.Common.dart';

class Container
extends FinalClass<Container>
with Container_Common
{
  Map<Type, InstanceProducer> _producers = {};

  ContainerOptions _options;

  ContainerOptions get options => _options;

  Container() {
    //FinalClass.check<Container>(this);
    this._options = new ContainerOptions(this);
  }

  //TODO
  void verify() {}

  // TODO change method's name
  void registerSimple<TService>(Constructor<TService> constructor, [Lifestyle lifestyle=null] )
    => register<TService, TService>(constructor, lifestyle);

  void register<TService, TImplementation extends TService>( Constructor<TImplementation> constructor, [Lifestyle lifestyle=null] )
  {
    Requires.isNotNull(constructor, 'constructor');
    Requires.isNotAnAmbiguousType(TService, 'TService');

    if( lifestyle == null )
      lifestyle = _options.defaultLifestyle;

    InstanceProducer instanceProducer = lifestyle.createInstanceProducer<TService, TImplementation>(constructor);

    addInstanceProducer(typeof<TService>(), instanceProducer);

    /*Instance element = _elements[type];
    if( element != null )
      throw new TypeAlreadyRegisteredException(type);
    switch( lifestyle ) {
      case Lifestley.Singleton:
        _createSingletonInstance(type, creator());
        break;
      case Lifestyle.Transient:
        _createTransientInstance(type, creator);
        break;
      default:
    }*/
  }

  @protected void addInstanceProducer(Type serviceType, InstanceProducer instanceProducer) {
    Requires.isNotNull(serviceType, 'serviceType');
    Requires.isNotNull(instanceProducer, 'instanceProducer');
    _producers[serviceType] = instanceProducer;
  }

  @deprecated
  TService getInstance<TService>() => get<TService>();

  TService get<TService>() {
    Type type = typeof<TService>();
    InstanceProducer<TService> producer = _producers[type];
    if( producer == null )
      throw new ActivationException(type);
    return producer.create();
  }

  void unregister<TService>() => _producers.remove(typeof<TService>());

/*
  void _createSingletonInstance<C>( Type type, C instance ) {
    Instance element = new SingletonInstance(instance);
    _elements[type] = element;
  }

  void _createTransientInstance<C>( Type type, New<C> creator ) {
    Instance element = new TransientInstance(creator);
    _elements[type] = element;
  }*/

}

