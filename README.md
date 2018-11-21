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

## Registering

