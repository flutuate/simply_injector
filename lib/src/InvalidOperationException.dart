/// The standard exception thrown when a operation is invalid.
class InvalidOperationException implements Exception {
  final String _message;

  InvalidOperationException(this._message);

  @override
  String toString() {
    return '$runtimeType: $_message';
  }
}
