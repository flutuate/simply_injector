import 'IUserRepository.dart';

class InMemoryUserRepository
implements IUserRepository
{
  static int counter = 0;
  InMemoryUserRepository() {
    counter++;
    print('InMemoryUserRepository: $counter');
  }
}