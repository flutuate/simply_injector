import 'package:simply_injector/src/Container.dart';
import 'package:test/test.dart';

abstract class IEntity<T extends IEntity<T>> {}

abstract class IRepo<T extends IEntity<T>> {}

class Entity implements IEntity<Entity> {}

class RepoA<T extends IEntity<T>> implements IRepo<T> {}

class RepoB<T extends IEntity<T>> implements IRepo<T> {}

void main() {
  group('CuriouslyRecurringTemplatePatternTests', () {
    setUp(() {});

    test('RegisterOpenGeneric_CuriouslyRecurringTemplatePattern_Succeeds', () {
      var container = new Container();
      container.register<IRepo, RepoA>(() => new RepoA<Entity>());
    });

    test('GetInstance_CuriouslyRecurringTemplatePattern_Succeeds', () {
      var container = new Container();
      container.register<IRepo, RepoA<Entity>>(() => new RepoA<Entity>());
      var repo = container.get<IRepo>();
      print(repo);
    });
  });
}
