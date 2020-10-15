import 'Instance.dart';
import 'core.dart';

/// Represents a transient instance of [C].
class TransientInstance<C> implements Instance<C> {
  Constructor<C> _creator;

  C get instance {
    return _creator();
  }

  TransientInstance(this._creator);
}
