import 'package:meta/meta.dart';

import 'ContainerOptions.dart';
import 'InstanceProducer.dart';
import 'Lifestyle.dart';
import 'Requires.dart';
import 'core.dart';
import 'exceptions/ActivationException.dart';
import 'exceptions/TypeAlreadyRegisteredException.dart';

/// Convenient [Container] to keep compatibility with the original library.
@sealed
class SimplyInjector extends Container {
  /// Convenient [Container] constructor to keep compatibility with the original library.
  SimplyInjector.Container() {
    Container();
  }
}

/// Container is used to register mappings between each abstraction (service)
/// and its corresponding implementation (component).
class Container {
  final Map<Type, InstanceProducer> _producers = {};

  final ContainerOptions options = ContainerOptions();

  /// Registers a constructor for type [TService]. This constructor must be
  /// specified in [constructor] and must generate an instance of [TService].
  /// Default value of [lifestyle] is [Lifestyle.transient].
  void registerSimple<TService>(Constructor<TService> constructor,
          [Lifestyle lifestyle = Lifestyle.transient]) =>
      register<TService, TService>(constructor, lifestyle);

  /// Registers a constructor for type [TService]. This constructor must be
  /// specified in [constructor] and must generate an instance
  /// of [TImplementation] which, in turn, must inherit from [TService].
  /// Default value of [lifestyle] is [Lifestyle.transient].
  void register<TService, TImplementation extends TService>(
      Constructor<TImplementation> constructor,
      [Lifestyle lifestyle = Lifestyle.transient]) {
    Requires.isNotAnAmbiguousType(TService, 'TService');

    if (!options.allowOverridingRegistrations && _producers.containsKey(TService)) {
      throw TypeAlreadyRegisteredException(TService);
    }

    var instanceProducer = lifestyle
        .createInstanceProducer<TService, TImplementation>(constructor);

    addInstanceProducer(TService, instanceProducer);
  }

  @protected
  void addInstanceProducer(
      Type serviceType, InstanceProducer instanceProducer) {
    _producers[serviceType] = instanceProducer;
  }

  /// Gets an instance of the given [TService].
  /// Throws [ActivationException] when there are errors resolving the service
  /// instance.
  TService get<TService>() {
    final producer = _producers[TService];
    if (producer == null) {
      throw ActivationException(TService);
    }
    return producer.create();
  }

  /// Unregisters the producer to [TService], if it already registered.
  void unregister<TService>() => _producers.remove(TService);

  void dispose() {
    _producers.clear();
  }
}
