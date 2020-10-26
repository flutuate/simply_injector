// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector/StringResources.cs
// https://github.com/simpleinjector/SimpleInjector/blob/master/src/SimpleInjector.Tests.Unit/AmbiguousTypesTests.cs
import 'package:simply_injector/simply_injector.dart';
import 'package:test/test.dart';

void main() {
  group('[Ambiguous types tests]', ()
  {
    test('Given a ambiguous object (String) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<dynamic, dynamic>(() => 'hello, world!');
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (int) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<dynamic, dynamic>(() => 1234567);
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (dynamic) When registering it using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<dynamic, dynamic>(() => typeof<dynamic>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (dynamic) When registering it using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.registerSimple<dynamic>(() => typeof<dynamic>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (bool) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<Type, Type>(() => typeof<bool>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (int) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<Type, Type>(() => typeof<int>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (double) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<Type, Type>(() => typeof<double>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a ambiguous object (num) When registering it as "Type" using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<Type, Type>(() => typeof<num>());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a string object When registering it as singleton using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<String, String>(() => "some value", Lifestyle.singleton);
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a string object When registering it using the declarative method Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<String, String>(() => "some value");
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a string object When registering it as singleton Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.registerSimple<String>( () => "some value", Lifestyle.singleton);
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a string object When registering it Then it must throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.registerSimple<String>(() => "some value");
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

    test('Given a "Container" object When registering it Then throws ArgumentError', () {
      final container = SimplyInjector.Container();
      try {
        container.register<Container, Container>(() => SimplyInjector.Container());
      }
      catch (e) {
        expect(e, TypeMatcher<ArgumentError>());
      }
    });

  });
}
