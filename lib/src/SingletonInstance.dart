import 'Instance.dart';

class SingletonInstance<C>
implements Instance<C>
{
  C _instance;

  C get instance => _instance;

  SingletonInstance( this._instance );
}
