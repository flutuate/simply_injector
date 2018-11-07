import 'simply_injector_core.dart';
import 'Instance.dart';

class TransientInstance<C>
implements Instance<C>
{
  New<C> _creator;

  C get instance {
    return _creator();
  }

  TransientInstance( this._creator );
}
