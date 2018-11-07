class Guid 
{
  String value;

  Guid(this.value);

  static Guid Parse(String value) => Guid(value);
  
  @override
  String toString() {
    return 'value=$value';
  }
}
