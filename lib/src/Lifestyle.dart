import 'package:simply_injector/src/Container.dart';

enum Lifestyle {
  Singleton,
  Transient,
  Scoped
}

/*abstract class LifestyleEx
{
  //Singleton, Transient, Scoped

  /// <summary>
  /// Creates a new <see cref="Registration"/> instance defining the creation of the
  /// specified <typeparamref name="TConcrete"/> with the caching as specified by this lifestyle,
  /// or returns an already created <see cref="Registration"/> instance for this container + lifestyle
  /// + type combination.
  /// </summary>
  /// <typeparam name="TConcrete">The concrete type that will be registered.</typeparam>
  /// <param name="container">The <see cref="Container"/> instance for which a
  /// <see cref="Registration"/> must be created.</param>
  /// <returns>A new or cached <see cref="Registration"/> instance.</returns>
  /// <exception cref="ArgumentNullException">Thrown when <paramref name="container"/> is a null
  /// reference (Nothing in VB).</exception>
  Registration createRegistration<TConcrete extends Object>(Container container)
  //where TConcrete : class
  {
    Requires.IsNotNull(container, 'container');
    return this._createRegistrationInternal<TConcrete>(container, preventTornLifestyles: true);
  }

  Registration _createRegistrationInternal<TConcrete extends Object>(Container container, {bool preventTornLifestyles})
    => preventTornLifestyles
      ? this.createRegistrationFromCache<TConcrete>(container)
      : this.createRegistrationCore<TConcrete>(container);
}
*/