import 'simply_injector_core.dart';

/// The standard exception thrown when an inherited class from [Final] is extended.
class FinalClassException<T> implements Exception {
  final String _message;

  FinalClassException()
      : _message = 'Class ${typeof<T>()} is final and cannot be extended';

  @override
  String toString() => _message;
}
