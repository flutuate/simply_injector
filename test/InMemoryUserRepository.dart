import 'IUserRepository.dart';

class InMemoryUserRepository
implements IUserRepository
{
  InMemoryUserRepository() { print('InMemoryUserRepository'); }
}