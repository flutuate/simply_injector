class ConcreteTypeWithValueTypeConstructorArgument {
  ConcreteTypeWithValueTypeConstructorArgument(int intParam) {}
}

abstract class IRepository {
}

abstract class UserRepository implements IRepository {
  final createdAt;

  UserRepository() :
    createdAt = DateTime.now();

  @override
  String toString() {
    return 'Created at $createdAt';
  }
}

class SqlUserRepository extends UserRepository {
  SqlUserRepository() {
    print('SqlUserRepository');
  }
}

class InMemoryUserRepository extends UserRepository {
  InMemoryUserRepository() : super() {
    print('InMemoryUserRepository');
  }
}

class CovariantImplementation<T> implements ICovariant<T> {}

abstract class ICovariant<T> {}
