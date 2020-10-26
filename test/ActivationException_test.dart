import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';

void main() {
  group('ActivationExceptionTests', () {
    test('Constructor always succeeds', constructorAlwaysSucceeds);
  });
}

abstract class IService {}

void constructorAlwaysSucceeds() {
  // Act
  new ActivationException(IService);
}
