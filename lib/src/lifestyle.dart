import 'package:meta/meta.dart';
import 'package:simply_injector/simply_injector.dart';

part 'singleton_lifestyle.dart';
part 'transient_lifestyle.dart';

/// Instances returned from the container can be cached.
abstract class Lifestyle {
  static const Lifestyle transient = TransientLifestyle();
  static const Lifestyle singleton = SingletonLifestyle();

  final String name;

  @protected
  const Lifestyle(this.name);

  InstanceProducer createInstanceProducer<TService, TImplementation>(
      Constructor<TImplementation> constructor);
}
