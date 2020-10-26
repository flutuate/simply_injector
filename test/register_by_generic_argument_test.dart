import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'TestClasses.dart';

void main() {
  group('[Register by generic argument]', () {
    setUp(() {});

    test('Given a generic argument When registering it Then it must be succeed', () {
      final container = SimplyInjector.Container();
      container.register<IRepository, SqlUserRepository>(
          () => new SqlUserRepository());
    });

    test('Given a registered type When get instance Then it must returns instance of expected type', () {
      final container = SimplyInjector.Container();
      container.register<IRepository, SqlUserRepository>(
          () => new SqlUserRepository());
      IRepository instance = container.get<IRepository>();
      expect(instance, TypeMatcher<SqlUserRepository>());
    });

    test('Given a registered type When get instance Then it must returns a new instance on each call', () {
      final container = SimplyInjector.Container();
      container.register<IRepository, InMemoryUserRepository>(
          () => new InMemoryUserRepository());
      var instance1 = container.get<IRepository>();
      var instance2 = container.get<IRepository>();
      expect(identical(instance1, instance2), isFalse,
          reason:
              'Register<TService, TImplementation>() should return transient objects.');
    });

    test('Given a object of covariant type When registering it by generic argument Then it must be succeeds', () {
      final container = SimplyInjector.Container();
      container.register<ICovariant<Object>, CovariantImplementation<String>>(
          () => new CovariantImplementation());

      ICovariant instance = container.get<ICovariant<Object>>();

      expect(instance, TypeMatcher<CovariantImplementation<String>>());
    });
  });
}
