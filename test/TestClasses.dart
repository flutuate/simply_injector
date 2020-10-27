class ConcreteTypeWithValueTypeConstructorArgument {
  ConcreteTypeWithValueTypeConstructorArgument(int intParam);
}

abstract class IRepository {
  int get number;
}

class UserRepository implements IRepository {
  static int _instanceNumber = 0;

  final int _number;

  UserRepository() : _number = _instanceNumber++;

  @override
  int get number => _number;
}

class SqlUserRepository extends UserRepository {
  @override
  bool operator ==(Object arg) {
    if (identical(this, arg)) {
      return true;
    }
    if (arg is! SqlUserRepository) {
      return false;
    }
    var other = arg;
    return other.number == number;
  }

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return number.toString();
  }
}

class InMemoryUserRepository extends UserRepository {
  @override
  bool operator ==(Object arg) {
    if (identical(this, arg)) {
      return true;
    }
    if (arg is! InMemoryUserRepository) {
      return false;
    }
    var other = arg;
    return other.number == number;
  }

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return number.toString();
  }
}

class CovariantImplementation<T> implements ICovariant<T> {}

abstract class ICovariant<T> {}
