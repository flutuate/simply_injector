import 'package:simply_injector/simply_injector.dart';
import 'package:test/test.dart';

void main() {
  group('[Container Tests]', ()
  {
    test('Given two instances of the Container When check equality Then they must be different', () {
      final container1 = SimplyInjector.Container();
      final container2 = SimplyInjector.Container();

      var result = container1 == container2;

      expect(result, isFalse);
    });

    test('Given a instance of Container When check instance Then it must be a Container type', () {
      final container = SimplyInjector.Container();

      expect(container, isA<Container>());
    });

    test('Given a instance of Container When get your runtime type Then it must be a SimplyInjector type', () {
      final container = SimplyInjector.Container();

      Type type = container.runtimeType;

      expect(type == typeof<SimplyInjector>(), isTrue);
    });
  });
}
