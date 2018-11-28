import 'package:meta/meta.dart';
import 'package:simply_injector/src/InstanceProducer.dart';
import 'package:simply_injector/src/Requires.dart';
import 'package:simply_injector/src/simply_injector_core.dart';

part 'TransientLifestyle.dart';
part 'SingletonLifestyle.dart';
part 'ScopedLifestyle.dart';

abstract class Lifestyle {
  static final Lifestyle Transient = new TransientLifestyle();
  static final Lifestyle Singleton = new SingletonLifestyle();
  //TODO static final Lifestyle Scoped = new _ScopedLifestyle();

  final String name;

  @protected
  Lifestyle(this.name) {
    Requires.isNotNullOrEmpty(name, 'name');
  }

  InstanceProducer createInstanceProducer<TService, TImplementation>(
      Constructor<TImplementation> constructor);
}
