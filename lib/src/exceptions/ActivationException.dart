/// The standard exception thrown when a container has an error in resolving
/// an object.
class ActivationException implements Exception {
  final String _message;

  ActivationException(Type type)
      : _message = 'No registration for type $type could be found.';

  ActivationException.string(this._message);

  @override
  String toString() {
    return '$runtimeType: $_message';
  }
}
