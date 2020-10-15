import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'ContainerFactory.dart';
import 'TestClasses.dart';

void main() {
  group('RegisterByGenericArgumentTests', () {
    setUp(() {});

    test('RegisterByGenericArgument_WithValidGenericArguments_Succeeds', () {
      Container container = ContainerFactory.New();
      container.register<IRepository, SqlUserRepository>(
          () => new SqlUserRepository());
    });

    test('GetInstance_OnRegisteredType_ReturnsInstanceOfExpectedType', () {
      Container container = ContainerFactory.New();
      container.register<IRepository, SqlUserRepository>(
          () => new SqlUserRepository());
      IRepository instance = container.get<IRepository>();
      expect(instance, TypeMatcher<SqlUserRepository>());
    });

    test('GetInstance_OnRegisteredType_ReturnsANewInstanceOnEachCall', () {
      Container container = ContainerFactory.New();
      container.register<IRepository, InMemoryUserRepository>(
          () => new InMemoryUserRepository());
      var instance1 = container.get<IRepository>();
      var instance2 = container.get<IRepository>();
      expect(identical(instance1, instance2), isFalse,
          reason:
              'Register<TService, TImplementation>() should return transient objects.');
    });

    test('RegisterByGenericArgument_RegisteringCovariantType_Succeeds()', () {
      Container container = ContainerFactory.New();
      container.register<ICovariant<Object>, CovariantImplementation<String>>(
          () => new CovariantImplementation());

      ICovariant instance = container.get<ICovariant<Object>>();

      expect(instance, TypeMatcher<CovariantImplementation<String>>());
    });
  });
}
