import 'file:///D:/projects/simply_injector/lib/src/exceptions/ActivationException.dart';
import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'ContainerFactory.dart';

void main() {
  group('ActivationExceptionTests', () {
    setUp(() {});

    test('Ctor_Always_Succeeds', ctor_Always_Succeeds);
  });
}

abstract class IService {}

void ctor_Always_Succeeds() {
  // Act
  new ActivationException(IService);
}
