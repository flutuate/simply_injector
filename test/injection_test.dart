import 'package:simply_injector/simply_injector.dart';
import 'TestClasses.dart';
import 'package:test/test.dart';

void main() {
  group('[Injection tests]', ()
  {
    test('When registering a singleton producer with registerSimple() method and get the same object', () {
      final container = SimplyInjector.Container();

      container.registerSimple<InMemoryUserRepository>(() => InMemoryUserRepository(),
          Lifestyle.singleton);

      final instance1 = container.get<InMemoryUserRepository>();

      final instance2 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1, instance2);
    });

    test('When registering a singleton producer with register() method and get the same object', () {
      final container = SimplyInjector.Container();

      container.register<IRepository, InMemoryUserRepository>(() => InMemoryUserRepository(),
          Lifestyle.singleton);

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<IRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1, instance2);
    });

    test('When registering a transient producer with registerSimple() method and get a different instance of same type', () {
      final container = SimplyInjector.Container();

      container.registerSimple<InMemoryUserRepository>(() =>  new InMemoryUserRepository());

      final instance1 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      final instance2 = container.get<InMemoryUserRepository>();

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1 != instance2, isTrue);
    });

    test('Given allowOverridingRegistrations is true When registering two singleton producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.options.allowOverridingRegistrations = true;

      container.registerSimple<IRepository>(() => InMemoryUserRepository(),
          Lifestyle.singleton);

      container.registerSimple<IRepository>(() => SqlUserRepository(),
          Lifestyle.singleton);

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('Given allowOverridingRegistrations is true When registering two transient producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.options.allowOverridingRegistrations = true;

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<IRepository>(() => SqlUserRepository());

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('When registering two singleton producers to same type Then it throws error type already registered', () {
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

    test('When registering two transient producers to same type Then it throws error type already registered', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      try {
        container.registerSimple<IRepository>(() => SqlUserRepository());
      }
      catch(e) {
        expect(e, isA<TypeAlreadyRegisteredException>());
      }
    });

    test('When registering two transient producers to types that inheriting from same type, then the instances must be different', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<UserRepository>(() => SqlUserRepository());

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<UserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<SqlUserRepository>());
    });

    test('When registering three transient producers to types that inheriting from same type, then the instances must be different', () {
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

