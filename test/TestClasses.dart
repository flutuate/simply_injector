import 'package:simply_injector/src/Container.dart';

class ContainerEx extends Container
{}

class ConcreteTypeWithValueTypeConstructorArgument
{
  ConcreteTypeWithValueTypeConstructorArgument(int intParam)
  {
  }
}

abstract class IUserRepository
{}

class SqlUserRepository
implements IUserRepository
{
  SqlUserRepository() {
    print('SqlUserRepository');
  }
}

class InMemoryUserRepository
implements IUserRepository
{
  static int counter = 0;

  InMemoryUserRepository() {
    counter++;
    print('InMemoryUserRepository: $counter');
  }
}


class CovariantImplementation<T>
implements ICovariant<T>
{
}

abstract class ICovariant<T>
{
}