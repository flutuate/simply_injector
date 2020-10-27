import 'Guid.dart';
import 'Order.dart';

abstract class IOrderRepository {
  Order getById(Guid guid);
  void save(Order order);
}
