import 'package:simply_injector/simply_injector.dart';
import 'TestClasses.dart';
import 'package:test/test.dart';

void main() {
  group('[Injection tests]', ()
  {
    test('Given a registered singleton producer with registerSimple() When get two instances Then they must be the same object', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => SqlUserRepository(),
          Lifestyle.singleton);

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<IRepository>();

      expect(instance1.number, instance2.number);
    });

    test('Given a registered singleton producer with register() When get two instances Then they must be the same object', () {
      final container = SimplyInjector.Container();

      container.register<IRepository, SqlUserRepository>(() => SqlUserRepository(),
          Lifestyle.singleton);

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<IRepository>();

      expect(instance1.number, instance2.number);
    });

    test('Given a registered transient producer with registerSimple() When get two instances Then they must be instance of same type but not same instance', () {
      final container = SimplyInjector.Container();

      container.registerSimple<InMemoryUserRepository>(() =>  InMemoryUserRepository());

      final instance1 = container.get<InMemoryUserRepository>();

      final instance2 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1 == instance2, isFalse);
    });

    test('Given allowOverridingRegistrations be true When registering two singleton producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.options.allowOverridingRegistrations = true;

      container.registerSimple<IRepository>(() => InMemoryUserRepository(),
          Lifestyle.singleton);

      container.registerSimple<IRepository>(() => SqlUserRepository(),
          Lifestyle.singleton);

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('Given allowOverridingRegistrations be true When registering two transient producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.options.allowOverridingRegistrations = true;

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<IRepository>(() => SqlUserRepository());

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('Given two singleton producers to same type When registering the second producer Then it throws error type already registered', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository(),
          Lifestyle.singleton);

      try {
        container.registerSimple<IRepository>(() => SqlUserRepository(),
            Lifestyle.singleton);
      }
      catch(e) {
        expect(e, isA<TypeAlreadyRegisteredException>());
      }
    });

    test('Given two transient producers to same type When registering the second Then it throws error type already registered', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      try {
        container.registerSimple<IRepository>(() => SqlUserRepository());
      }
      catch(e) {
        expect(e, isA<TypeAlreadyRegisteredException>());
      }
    });

    test('Given two registered transient producers inherited from same type When get instances of them Then the instances must be different', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<UserRepository>(() => SqlUserRepository());

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<UserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<SqlUserRepository>());
    });

    test('Given three registered transient producers inherited same type When get instances of them Then the instances must be different', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<UserRepository>(() => SqlUserRepository());

      container.registerSimple<InMemoryUserRepository>(() => InMemoryUserRepository());

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<UserRepository>();

      final instance3 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<SqlUserRepository>());

      expect(instance3, isA<InMemoryUserRepository>());
    });
  });

}

