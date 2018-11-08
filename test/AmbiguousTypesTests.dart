import 'package:simply_injector/simply_injector.dart';
import 'package:test/test.dart';
import 'ContainerFactory.dart';

void main()
{
  group('AmbiguousTypesTests', ()
  {
    setUp(() {
    });

    test('registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException', registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException );

    test('registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException', registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException );

  });
}

abstract class IService {}

class Service1 implements IService {}

class Service2 implements IService {}

void registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException()
{
  // Arrange
  var container = ContainerFactory.New();

  // Act
  container.register<String, String>(() => "some value" );
  container.register<int, int>(() => 123 );

  print( container.get<String>() );
  print( container.get<int>() );
}

 void registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException()
{
  // Arrange
  var container = ContainerFactory.New();

  container.register<IService, IService>(() => new Service1());

  container.register<IService, IService>(() => new Service2());

  // Act
  container.register<Type, Type>(() => typeof<int>());

  print( container.get<Type>() );
}

/*
void assert_RegistrationFailsWithExpectedAmbiguousMessage(String typeName, Action action)
{
  try
  {
    // Act
    action();

    // Assert
    Assert.Fail("Exception expected.");
  }
  catch (ArgumentException ex)
  {
  string message = @"
  You are trying to register " + typeName + @" as a service type, but registering this type
  is not allowed to be registered because the type is ambiguous";

  AssertThat.ExceptionMessageContains(message.TrimInside(), ex);
  }
}*/