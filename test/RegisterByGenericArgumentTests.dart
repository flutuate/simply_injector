import 'package:simply_injector/src/ArgumentException.dart';
import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'ContainerFactory.dart';
import 'IUserRepository.dart';
import 'InMemoryUserRepository.dart';
import 'SqlUserRepository.dart';
import 'TestClasses.dart';

void main()
{
  group('AddRegistrationTests', ()
  {
    setUp(() {});

    test('RegisterByGenericArgument_WithValidGenericArguments_Succeeds', () {
      Container container = ContainerFactory.New();
      container.register<IUserRepository, SqlUserRepository>(() => new SqlUserRepository());
    } );

    test('GetInstance_OnRegisteredType_ReturnsInstanceOfExpectedType', () {
      Container container = ContainerFactory.New();
      container.register<IUserRepository, SqlUserRepository>(() => new SqlUserRepository());
      IUserRepository instance = container.get<IUserRepository>();
      expect(instance, TypeMatcher<SqlUserRepository>() );
    } );

    test('GetInstance_OnRegisteredType_ReturnsANewInstanceOnEachCall', () {
      Container container = ContainerFactory.New();
      container.register<IUserRepository, InMemoryUserRepository>(() => new InMemoryUserRepository());
      var instance1 = container.get<IUserRepository>();
      var instance2 = container.get<IUserRepository>();
      expect(identical(instance1,instance2), isFalse, reason: 'Register<TService, TImplementation>() should return transient objects.');
    } );

    test('RegisterByGenericArgument_GenericArgumentOfInvalidType_ThrowsException', () {
      Container container = ContainerFactory.New();
      Function action = () => container.register<Object, ConcreteTypeWithValueTypeConstructorArgument>(() => new ConcreteTypeWithValueTypeConstructorArgument(0));
      expect(action(), TypeMatcher<ArgumentException>() );
    } );
  });
}
