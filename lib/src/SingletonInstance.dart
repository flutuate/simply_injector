import 'Instance.dart';

/// Represents a singleton instance of [C].
class SingletonInstance<C> implements Instance<C> {
  final C _instance;

  @override
  C get instance => _instance;

  SingletonInstance(this._instance);
}
