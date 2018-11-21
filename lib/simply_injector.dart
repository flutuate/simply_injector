/// Support for doing something awesome.
///
/// More dartdocs go here.
library simply_injector;

import 'package:simply_injector/src/Container.dart';
import 'package:simply_injector/src/FinalClass.dart';
export 'src/simply_injector_core.dart';
export 'src/Container.dart';
export 'src/FinalClass.dart';
export 'src/FinalClassException.dart';
export 'src/Instance.dart';
export 'src/Lifestyle.dart';
export 'src/SingletonInstance.dart';
export 'src/TransientInstance.dart';

// TODO: Export any libraries intended for clients of this package.

void main()
{
  Container x = SimplyInjector.Container();
  print(x.runtimeType);
}