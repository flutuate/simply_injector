import 'package:simply_injector/simply_injector.dart';
import 'package:simply_injector/src/ContainerOptions.dart';
import 'package:simply_injector/src/InvalidOperationException.dart';
import 'package:test/test.dart';

import 'IUserRepository.dart';
import 'InMemoryUserRepository.dart';
import 'SqlUserRepository.dart';

void main()
{
  group('AmbiguousTypesTests', ()
  {
    setUp(() {});

    ContainerOptions getContainerOptions() => new Container().options;

    test('AllowOverridingRegistrations_WhenNotSet_IsFalse', () {
      ContainerOptions options = getContainerOptions();
      expect(options.allowOverridingRegistrations, isFalse);
    });

    test('AllowOverridingRegistrations_SetToFalse_ContainerDoesNotAllowOverringRegistrations', () {
      var container = new Container();
      container.options.allowOverridingRegistrations = false;
      container.register<IUserRepository, SqlUserRepository>( () => new SqlUserRepository() );
      Action action = () => container.register<IUserRepository, InMemoryUserRepository>( () => new InMemoryUserRepository() );
      expect(() => action, throwsA(TypeMatcher<InvalidOperationException>()));
    });
  });
}