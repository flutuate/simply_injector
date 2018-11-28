// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector/StringResources.cs
// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector.Tests.Unit/AmbiguousTypesTests.cs
import 'package:simply_injector/simply_injector.dart';
import 'package:simply_injector/src/ArgumentException.dart';
import 'package:test/test.dart';
import 'ContainerFactory.dart';

void main() {
  group('AmbiguousTypesTests', () {
    setUp(() {});

    test('RegisterFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException',
        () {
      var container = ContainerFactory.New();
      expect(() => container.register<String, String>(() => "some value"),
          throwsA(TypeMatcher<ArgumentException>()));
    });

    test('RegisterFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException',
        () {
      var container = ContainerFactory.New();
      expect(() => container.register<Type, Type>(() => typeof<int>()),
          throwsA(TypeMatcher<ArgumentException>()));
    });

    test('RegisterSingleFunc_SuppliedWithAmbiguousType_ThrowsExpectedException',
        () {
      var container = ContainerFactory.New();
      expect(
          () => container.register<String, String>(
              () => "some value", Lifestyle.Singleton),
          throwsA(TypeMatcher<ArgumentException>()));
    });

    test(
        'RegisterFunc_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName',
        () {
      var container = ContainerFactory.New();
      expect(() => container.registerSimple<String>(() => "some value"),
          throwsA(TypeMatcher<ArgumentException>()));
    });

    test(
        'RegisterSingleFunc_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName',
        () {
      var container = ContainerFactory.New();
      expect(
          () => container.registerSimple<String>(
              () => "some value", Lifestyle.Singleton),
          throwsA(TypeMatcher<ArgumentException>()));
    });

    test(
        'RegisterSingleValue_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName',
        () {
      var container = ContainerFactory.New();
      expect(() => container.registerSimple<String>(() => "some value"),
          throwsA(TypeMatcher<ArgumentException>()));
    });
  });
}
