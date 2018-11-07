import 'Guid.dart';

class CancelOrder 
{
  Guid OrderId;
  
  CancelOrder(this.OrderId);

  @override
  String toString() {
    return OrderId.toString();
  }
}
