import 'package:simply_injector/src/Container.dart';

class ContainerOptions
{
  Container _container;

  bool _allowOverridingRegistrations = false;

  ContainerOptions(this._container);

  bool get allowOverridingRegistrations => _allowOverridingRegistrations;

  set allowOverridingRegistrations (bool value) => _allowOverridingRegistrations = value;

}