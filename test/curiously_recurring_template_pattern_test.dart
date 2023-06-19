import 'package:simply_injector/src/container.dart';
import 'package:test/test.dart';

abstract class IEntity<T extends IEntity<T>> {}

abstract class IRepo<T extends IEntity<T>> {}

class Entity implements IEntity<Entity> {}

class RepoA<T extends IEntity<T>> implements IRepo<T> {}

class RepoB<T extends IEntity<T>> implements IRepo<T> {}

void main() {
  group('[Curiously Recurring Template Pattern Tests]', () {
    setUp(() {});

    test('''
    Given a open generic object 
    When registering it using curiously recurring template pattern 
    Then it must be succeeds
    ''', () {
      var container = Container();
      container.register<IRepo, RepoA>(() => RepoA<Entity>());
    });

    test('''
    Given a open generic object 
    When registering it using curiously recurring template pattern 
    When get instance Then it must be succeeds
    ''', () {
      var container = Container();
      container.register<IRepo, RepoA<Entity>>(() => RepoA<Entity>());
      var repo = container.get<IRepo>();
      expect(repo, isA<RepoA<Entity>>());
    });
  });
}
