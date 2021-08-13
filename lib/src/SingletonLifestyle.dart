part of 'Lifestyle.dart';

@protected
class SingletonLifestyle extends Lifestyle {
  const SingletonLifestyle() : super('Singleton');

  @override
  InstanceProducer createInstanceProducer<TService, TImplementation>(
          Constructor<TImplementation> constructor) =>
      _SingletonInstanceProducer<TService, TImplementation>(
          TService, TImplementation, constructor());
}

class _SingletonInstanceProducer<TService, TImplementation>
    implements InstanceProducer<TService> {
  final TImplementation _singletonInstance;

  _SingletonInstanceProducer(
      Type serviceType, Type implementationType, this._singletonInstance);

  @override
  TService create() {
    return _singletonInstance as TService;
  }
}
