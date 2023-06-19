/// The standard exception thrown when a type already registered
/// in the [Container].
class TypeAlreadyRegisteredException implements Exception {
  final String _message;

  TypeAlreadyRegisteredException(Type type)
      : _message = 'Type $type has already been registered.';

  @override
  String toString() {
    return '$runtimeType: $_message';
  }
}
