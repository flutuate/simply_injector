/// The standard exception thrown when an argument is invalid.
class ArgumentException implements Exception {
  final String _message;
  final String _paramName;

  ArgumentException(this._message, this._paramName);

  @override
  String toString() {
    return '$runtimeType: $_message\nParameter name: $_paramName';
  }
}
