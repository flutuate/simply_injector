import 'package:meta/meta.dart';
import 'package:simply_injector/simply_injector.dart';
import 'package:simply_injector/src/ContainerOptions.dart';
import 'package:simply_injector/src/InstanceProducer.dart';
import 'package:simply_injector/src/Requires.dart';

import 'Lifestyle.dart';
import 'core.dart';
import 'exceptions/ActivationException.dart';

part 'Container.Common.dart';

/// Convenient [Container] to keep compatibility with the original library.
@sealed
class SimplyInjector extends Container
{
  /// Convenient [Container] constructor to keep compatibility with the original library.
  SimplyInjector.Container() {
    new Container();
  }
}

/// Container is used to register mappings between each abstraction (service)
/// and its corresponding implementation (component).
class Container with Container_Common
{
  Map<Type, InstanceProducer> _producers = {};

  final ContainerOptions options = new ContainerOptions();

  /// Registers a constructor for type [TService]. This constructor must be
  /// specified in [constructor] and must generate an instance of [TService].
  void registerSimple<TService>(Constructor<TService> constructor, [Lifestyle lifestyle = Lifestyle.transient])
    => register<TService, TService>(constructor, lifestyle);

  /// Registers a constructor for type [TService]. This constructor must be
  /// specified in [constructor] and must generate an instance
  /// of [TImplementation] which, in turn, must inherit from [TService].
  void register<TService, TImplementation extends TService>(Constructor<TImplementation> constructor, [Lifestyle lifestyle = Lifestyle.transient])
  {
    Requires.isNotAnAmbiguousType(TService, 'TService');

    final type = typeof<TService>();
    if(!options.allowOverridingRegistrations && _producers.containsKey(type) ) {
      throw TypeAlreadyRegisteredException(type);
    }

    InstanceProducer instanceProducer = lifestyle
        .createInstanceProducer<TService, TImplementation>(constructor);

    addInstanceProducer(typeof<TService>(), instanceProducer);
  }

  @protected
  void addInstanceProducer( Type serviceType, InstanceProducer instanceProducer) {
    _producers[serviceType] = instanceProducer;
  }

  /// Gets an instance of the given [TService].
  /// Throws [ActivationException] when there are errors resolving the service instance.
  TService get<TService>() {
    Type type = typeof<TService>();
    final producer = _producers[type];
    if (producer == null) {
      throw new ActivationException(type);
    }
    return producer.create();
  }

  /// Unregisters the producer to [TService], if it already registered.
  void unregister<TService>() => _producers.remove(typeof<TService>());
}
