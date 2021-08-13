class Guid {
  final String value;

  Guid(this.value);

  static Guid parse(String value) => Guid(value);

  @override
  String toString() {
    return 'value=$value';
  }
}
