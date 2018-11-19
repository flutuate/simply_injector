import 'package:test/test.dart';
import 'package:simply_injector/simply_injector.dart';
import 'ContainerFactory.dart';

void main()
{
  group('AddRegistrationTests', ()
  {
    setUp(() {
    });

     test('Equals_OnSameInstance_ReturnsTrue', () {
       // Arrange
       var container = ContainerFactory.New();

       // Act
       var result = container == container;

       // Assert
       expect(result, isTrue);
     } );

    test('Equals_OnDifferentInstance_ReturnsFalse', () {
      // Arrange
      var container1 = ContainerFactory.New();
      var container2 = ContainerFactory.New();

      // Act
      var result = container1 == container2;

      // Assert
      expect(result, isFalse);
    });

    test('ToString_Always_ReturnsExpectedValue', () {
      // Arrange
      var container = ContainerFactory.New();

      // Act
      var result = container.toString();

      // Assert
      expect(result, "Instance of 'Container'");
    }

    );
  });
}

abstract class IService
{}
