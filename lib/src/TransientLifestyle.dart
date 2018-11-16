part of 'Lifestyle.dart';

@protected class TransientLifestyle
extends Lifestyle
{
  TransientLifestyle(): super('Transient');

  @override
  InstanceProducer createInstanceProducer<TService, TImplementation>(Constructor<TImplementation> constructor)
    => new _TransientInstanceProducer<TService, TImplementation>(typeof<TService>(), typeof<TImplementation>(), constructor());
}

class _TransientInstanceProducer<TService, TImplementation>
implements InstanceProducer<TService>
{
  TImplementation _singletonInstance;

  _TransientInstanceProducer(Type serviceType, Type implementationType, this._singletonInstance);

  @override TService create() {
    return _singletonInstance as TService;
  }
}
