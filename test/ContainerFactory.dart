import 'package:simply_injector/simply_injector.dart';

class ContainerFactory
{
  static Container New()
  {
    var container = new Container();

    //container.Options.EnableDynamicAssemblyCompilation = true;

    return container;
  }
}