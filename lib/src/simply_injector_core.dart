typedef C Constructor<C>();

Type typeof<T>() => T;

/*class Pai {
  @override String toString() => "Pai";
}

class Filho extends Pai {
  static int _count = 0;
  Filho() {
    ++_count;
  }
  @override String toString() => "Filho:$_count";
}

class Neto extends Pai {
  static int _count = _count + 1;
  String nome;
  Neto(this.nome) {}
  @override String toString() => "Neto $nome:$_count";
}

abstract class Interface {
  @override String toString() => "Interface";
}

class Implementacao
    implements Interface
{
  @override String toString() => "Implementacao";
}

void m<C>( Type c ) {
  print(c);
  print(c.runtimeType);
}*

void main()
{

  new C();

  // 1. Create a new Simple Injector container
  Container container = new Container();

  /##/
  container.register<Pai, Filho>(() => new Filho(), lifestyle: Lifestyle.Singleton );
  print(container.getInstance<Pai>());
  print(container.getInstance<Pai>());
  print(container.getInstance<Pai>());

  container.unregister<Pai>();

  container.register<Pai, Filho>(() => new Neto('luciano'));
  print(container.getInstance<Pai>());
  print(container.getInstance<Pai>());
  print(container.getInstance<Pai>());

  /##/
}
*/
