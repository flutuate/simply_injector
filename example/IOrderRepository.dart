import 'Guid.dart';
import 'Order.dart';

abstract class IOrderRepository
{
  Order GetById(Guid guid);
  void Save(Order order);
}
