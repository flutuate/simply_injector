// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector/StringResources.cs
// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector.Tests.Unit/AmbiguousTypesTests.cs
import 'package:simply_injector/simply_injector.dart';
import 'package:simply_injector/src/ArgumentException.dart';
import 'package:test/test.dart';
import 'ContainerFactory.dart';

void main()
{
  group('AmbiguousTypesTests', ()
  {
    setUp(() {});

    test('registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException', registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException );
    test('registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException', registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException );
    test('registerSingleFunc_SuppliedWithAmbiguousType_ThrowsExpectedException', registerSingleFunc_SuppliedWithAmbiguousType_ThrowsExpectedException );
    test('registerSingleValue_SuppliedWithAmbiguousType_ThrowsExpectedException', registerSingleValue_SuppliedWithAmbiguousType_ThrowsExpectedException );
    test('registerFunc_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName', registerFunc_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName );
  });
}

void registerFunc_SuppliedWithAmbiguousTypeString_ThrowsExpectedException() {
  var container = ContainerFactory.New();
  expect(() => container.register<String, String>(() => "some value"), throwsA(TypeMatcher<ArgumentException>()));
}

void registerFunc_SuppliedWithAmbiguousTypeType_ThrowsExpectedException() {
  var container = ContainerFactory.New();
  expect(() => container.register<Type, Type>(() => typeof<int>()), throwsA(TypeMatcher<ArgumentException>()));
}

void registerSingleFunc_SuppliedWithAmbiguousType_ThrowsExpectedException() {
  var container = ContainerFactory.New();
  expect(() => container.register<String, String>(() => "some value", lifestyle: Lifestyle.Singleton), throwsA(TypeMatcher<ArgumentException>()));
}

void registerSingleValue_SuppliedWithAmbiguousType_ThrowsExpectedException(){
  var container = ContainerFactory.New();
  expect(() => container.registerInstance<String>(() => "some value"), throwsA(TypeMatcher<ArgumentException>()));
}

void registerFunc_SuppliedWithAmbiguousType_ThrowsExceptionWithExpectedParamName() {
  var container = ContainerFactory.New();
  expect(() => container.registerService<String>(() => "some value"), throwsA(TypeMatcher<ArgumentException>()));
}