class ActivationException
implements Exception
{
  final String _message;

  ActivationException(Type type)
      : _message = 'No registration for type $type could be found.';

  @override String toString() {
    return '$runtimeType: $_message';
  }
}
