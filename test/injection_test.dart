import 'package:simply_injector/simply_injector.dart';
import 'TestClasses.dart';
import 'file:///D:/projects/simply_injector/lib/src/exceptions/ArgumentException.dart';
import 'package:test/test.dart';
import 'ContainerFactory.dart';

void main() {
  group('Injection tests', ()
  {
    setUp(() {});

    test('Registers a singleton producer with registerSimple() method and get the same object', () {
      final container = SimplyInjector.Container();

      container.registerSimple<InMemoryUserRepository>(() => InMemoryUserRepository(),
          Lifestyle.Singleton);

      final instance1 = container.get<InMemoryUserRepository>();

      final instance2 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1, instance2);
    });

    test('Registers a singleton producer with register() method and get the same object', () {
      final container = SimplyInjector.Container();

      container.register<IRepository, InMemoryUserRepository>(() => InMemoryUserRepository(),
          Lifestyle.Singleton);

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<IRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1, instance2);
    });

    test('Registers a transient producer with registerSimple() method and get a different instance of same type', () {
      final container = SimplyInjector.Container();

      container.registerSimple<InMemoryUserRepository>(() =>  new InMemoryUserRepository());

      final instance1 = container.get<InMemoryUserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      final instance2 = container.get<InMemoryUserRepository>();

      expect(instance2, isA<InMemoryUserRepository>());

      expect(instance1 != instance2, isTrue);
    });

    test('When to register two singleton producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository(),
          Lifestyle.Singleton);

      container.registerSimple<IRepository>(() => SqlUserRepository(),
          Lifestyle.Singleton);

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('When to register two transient producers to same type, then the last assumes the production', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<IRepository>(() => SqlUserRepository());

      final instance = container.get<IRepository>();

      expect(instance, isA<SqlUserRepository>());
    });

    test('When to register two transient producers to types that inheriting from same type, then the instances must be different', () {
      final container = SimplyInjector.Container();

      container.registerSimple<IRepository>(() => InMemoryUserRepository());

      container.registerSimple<UserRepository>(() => SqlUserRepository());

      final instance1 = container.get<IRepository>();

      final instance2 = container.get<UserRepository>();

      expect(instance1, isA<InMemoryUserRepository>());

      expect(instance2, isA<SqlUserRepository>());
    });

    test('When to register three transient producers to types that inheriting from same type, then the instances must be different', () {
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

    test('When to try register ambiguous types, then it must throws ArgumentException', () {
      final container = SimplyInjector.Container();
      expect(() => container.registerSimple<Container>(() => SimplyInjector.Container()),
          throwsA(TypeMatcher<ArgumentException>()));
    });

  });

}

