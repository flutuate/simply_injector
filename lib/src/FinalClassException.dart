import 'simply_injector_core.dart';

class FinalClassException<T> implements Exception {
  final String _message;

  FinalClassException()
      : _message = 'Class ${typeof<T>()} is final and cannot be extended';

  @override
  String toString() => _message;
}
