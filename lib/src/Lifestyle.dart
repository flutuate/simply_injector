import 'package:meta/meta.dart';
import 'package:simply_injector/src/InstanceProducer.dart';
import 'package:simply_injector/src/core.dart';

part 'ScopedLifestyle.dart';
part 'SingletonLifestyle.dart';
part 'TransientLifestyle.dart';

/// Instances returned from the container can be cached.
abstract class Lifestyle
{
  static const Lifestyle transient = TransientLifestyle();
  static const Lifestyle singleton = SingletonLifestyle();
  //TODO static final Lifestyle scoped = new _ScopedLifestyle();

  final String name;

  @protected
  const Lifestyle(this.name);

  InstanceProducer createInstanceProducer<TService, TImplementation>( Constructor<TImplementation> constructor );
}
