import 'package:simply_injector/src/Container.dart';
import 'package:simply_injector/src/core.dart';
import 'package:test/test.dart';
import 'ContainerFactory.dart';

void main() {
  group('ContainerTests', () {
    setUp(() {});

    test('Equals_OnSameInstance_ReturnsTrue', () {
      var container = ContainerFactory.New();

      var result = container == container;

      expect(result, isTrue);
    });

    test('Equals_OnDifferentInstance_ReturnsFalse', () {
      var container1 = ContainerFactory.New();
      var container2 = ContainerFactory.New();

      var result = container1 == container2;

      expect(result, isFalse);
    });

    test('ToString_Always_ReturnsExpectedValue', () {
      var container = ContainerFactory.New();

      var result = container.toString();

      expect(result, "Instance of 'Container'");
    });

    test('GetType_Always_ReturnsTheExpectedType', () {
      var container = ContainerFactory.New();

      Type type = container.runtimeType;

      expect(type == typeof<Container>(), isTrue);
    });
  });
}
