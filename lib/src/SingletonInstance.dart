import 'Instance.dart';

/// Represents a singleton instance of [C].
class SingletonInstance<C> implements Instance<C> {
  C _instance;

  C get instance => _instance;

  SingletonInstance(this._instance);
}
