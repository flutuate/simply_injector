part of 'Lifestyle.dart';

@protected class SingletonLifestyle
extends Lifestyle
{
  SingletonLifestyle(): super('Singleton');

  @override
  InstanceProducer createInstanceProducer<TService, TImplementation>(Constructor<TImplementation> constructor)
    => new _SingletonInstanceProducer<TService, TImplementation>(typeof<TService>(), typeof<TImplementation>(), constructor);
}

class _SingletonInstanceProducer<TService, TImplementation>
    implements InstanceProducer<TService>
{
  Constructor<TImplementation> _constructor;

  _SingletonInstanceProducer(Type serviceType, Type implementationType, this._constructor);

  @override TService create() {
    return _constructor() as TService;
  }
}
