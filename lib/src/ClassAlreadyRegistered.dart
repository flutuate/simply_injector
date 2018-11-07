class ClassAlreadyRegistered
implements Exception
{
  final String _message;

  ClassAlreadyRegistered(Type type)
    : _message = 'Type ${type.runtimeType} has already been registered.';

  @override String toString() {
    return _message;
  }
}
