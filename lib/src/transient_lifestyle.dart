part of 'lifestyle.dart';

@protected
class TransientLifestyle extends Lifestyle {
  const TransientLifestyle() : super('Transient');

  @override
  InstanceProducer createInstanceProducer<TService, TImplementation>(
          Constructor<TImplementation> constructor) =>
      _TransientInstanceProducer<TService, TImplementation>(
          TService, TImplementation, constructor);
}

class _TransientInstanceProducer<TService, TImplementation>
    implements InstanceProducer<TService> {
  final Constructor<TImplementation> _constructor;

  _TransientInstanceProducer(
      Type serviceType, Type implementationType, this._constructor);

  @override
  TService create() {
    return _constructor() as TService;
  }
}
