import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'ContainerFactory.dart';
/*
abstract class IService1
{}

abstract class IService2
{}

class Implementation implements IService1, IService2
{}

void GetInstanceOnTwoKeys_SameSingletonRegistrationForTwoKeys_ReturnsThatSameInstance() {
  // Arrange
  var container = ContainerFactory.New();

  var registration = Lifestyle.Singleton.CreateRegistration<Implementation>(container);

  container.addRegistration(typeof<IService1>(), registration);
  container.addRegistration(typeof<IService2>(), registration);

  // Act
  var instance1 = container.getInstance<IService1>();
  var instance2 = container.getInstance<IService2>();

  // Assert
  //expect( object.ReferenceEquals(instance1, instance2), isTrue);
  expect(instance1 == instance2, isTrue);
}

void main()
{
  group('AddRegistrationTests', ()
  {
    setUp(() {
    });

    test('First Test', GetInstanceOnTwoKeys_SameSingletonRegistrationForTwoKeys_ReturnsThatSameInstance );
  });
}
~~~~~~~~~~~~~~~~
[TestMethod]
public void AddRegistration_RegistrationFromAnotherContainer_FailsWithExpectedException()
{
  var container = ContainerFactory.New();

  var otherContainer = ContainerFactory.New();

  var registrationFromAnotherContainer =
  Lifestyle.Singleton.CreateRegistration<Implementation>(otherContainer);

  // Act
  Action action =
      () => container.AddRegistration(typeof(IService1), registrationFromAnotherContainer);

  AssertThat.ThrowsWithExceptionMessageContains<ArgumentException>(
      "The supplied Registration belongs to a different container.", action);
}

[TestMethod]
public void AddRegistration_SuppliedWithOpenGenericServiceType_ThrowsExpectedException()
{
  // Arrange
  Container container = new Container();

  var registration = Lifestyle.Transient.CreateRegistration<StructCommandHandler>(container);

  // Act
  Action action = () => container.AddRegistration(typeof(ICommandHandler<>), registration);

  // Assert
  AssertThat.ThrowsWithExceptionMessageContains<ArgumentException>(
      "The supplied type ICommandHandler<TCommand> is an open generic type.",
      action);
  AssertThat.ThrowsWithParamName("serviceType", action);
}

[TestMethod]
public void AddRegistration_SuppliedWithPartialOpenGenericServiceType_ThrowsExpectedException()
{
  // Arrange
  Container container = new Container();

  var registration = Lifestyle.Transient.CreateRegistration<StructCommandHandler>(container);

  // Act
  Action action = () => container.AddRegistration(
      typeof(ICommandHandler<>).MakeGenericType(typeof(List<>)),
      registration);

  // Assert
  AssertThat.ThrowsWithExceptionMessageContains<ArgumentException>(
      "The supplied type ICommandHandler<List<T>> is an open generic type.",
      action);
  AssertThat.ThrowsWithParamName("serviceType", action);
}

*/