part of 'Lifestyle.dart';

@protected
class SingletonLifestyle extends Lifestyle {
  const SingletonLifestyle() : super('Singleton');

  @override
  InstanceProducer createInstanceProducer<TService, TImplementation>(
          Constructor<TImplementation> constructor) =>
      new _SingletonInstanceProducer<TService, TImplementation>(
          typeof<TService>(), typeof<TImplementation>(), constructor());
}

class _SingletonInstanceProducer<TService, TImplementation>
    implements InstanceProducer<TService> {
  TImplementation _singletonInstance;

  _SingletonInstanceProducer(
      Type serviceType, Type implementationType, this._singletonInstance);

  @override
  TService create() {
    return _singletonInstance as TService;
  }
}
