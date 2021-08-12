# Simply Injector
**Simply Injector** is a dart package inspired and based on [Simple Injector library](https://simpleinjector.org/).

It is an easy-to-use dependency injection (DI) library and is easily integrated with [Flutter](https://flutter.io).

It’s easy to implement the dependency injection pattern with 
loosely coupled components using Simply Injector Dart Package.


## Configuration
Add `simply_injector` to `pubspec.yaml` under the `dependencies` field.

```yaml
dependencies:
  simply_injector: ^latest_version
```


## Import
Add the following import in your library :

```dart
import 'package:simply_injector/simply_injector.dart';
```


## Usage
Simply Injector's main type is the `Container`. An instance of *Container* is used to 
register mappings between each abstraction (service) and its corresponding implementation (component).

***Tip**: You should typically create a single Container instance for the whole application (one instance per app domain).*

It's possible create an instance of *Container* by some ways:
```dart
var container = new SimplyInjector.Container();
```
or
```dart
var container = new Container();
```
or using a library prefix to avoid conflict with Flutter's *Container' class:
```dart
import 'package:simply_injector/simply_injector.dart' as si;
... 
si.Container container = new si.Container();
```
The first way it's so much elegantly ;)


## Example
This is the main source of [complete example project at Simply Injector GitHub](https://github.com/flutuate/simply_injector/tree/master/example) repository:
```dart
import 'package:simply_injector/simply_injector.dart';

import 'CancelOrder.dart';
import 'CancelOrderHandler.dart';
import 'EventPublisher.dart';
import 'FileLogger.dart';
import 'Guid.dart';
import 'IEventPublisher.dart';
import 'ILogger.dart';
import 'IOrderRepository.dart';
import 'SqlOrderRepository.dart';

main()
{
  // 1. Create a new Simple Injector container
  var container = new SimplyInjector.Container();

  // 2. Configure the container (register)
  container.register<IOrderRepository, SqlOrderRepository>( () => new SqlOrderRepository(container.get<ILogger>()));
  container.register<ILogger, FileLogger>( () => new FileLogger(), Lifestyle.Singleton );
  container.register<IEventPublisher, EventPublisher>( () => new EventPublisher(), Lifestyle.Singleton );

  container.register<CancelOrderHandler, CancelOrderHandler>(()
    => new CancelOrderHandler(
      container.get<IOrderRepository>(),
      container.get<ILogger>(),
      container.get<IEventPublisher>() 
    )
  );

  // 3. Verify your configuration
  container.verify();

  // 4. Use the container
  var handler = container.getInstance<CancelOrderHandler>();

  var args = ['0123456789'];
  var orderId = Guid.Parse(args[0]);
  var command = new CancelOrder(orderId);

  handler.Handle(command);
}
```

