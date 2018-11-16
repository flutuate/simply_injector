import 'package:simply_injector/src/Container.dart';
import 'package:simply_injector/src/InvalidOperationException.dart';
import 'package:simply_injector/src/Lifestyle.dart';
import 'package:simply_injector/src/Requires.dart';
import 'package:simply_injector/src/StringResources.dart';

class ContainerOptions
{
  final Container container;
  bool allowOverridingRegistrations = false;

  ContainerOptions(this.container) {
    Requires.isNotNull(container, 'container');
  }

  Lifestyle _defaultLifestyle = Lifestyle.Transient;

  Lifestyle get defaultLifestyle => _defaultLifestyle;

  set defaultLifestyle (Lifestyle value) {
    Requires.isNotNull(value, 'value');
    _throwWhenContainerHasRegistrations('defaultLifestyle');
    _defaultLifestyle = value;
  }

  void _throwWhenContainerHasRegistrations(String propertyName)
  {
    if (container.isLocked || container.hasRegistrations)
    {
      throw new InvalidOperationException(
          StringResources.propertyCanNotBeChangedAfterTheFirstRegistration(propertyName));
    }
  }

}