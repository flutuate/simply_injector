class InvalidOperationException
implements Exception
{
  final String _message;

  InvalidOperationException(this._message);

  @override
  String toString() {
    return '$runtimeType: $_message';
  }
}