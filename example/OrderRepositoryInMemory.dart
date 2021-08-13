import 'Order.dart';
import 'ILogger.dart';
import 'IOrderRepository.dart';
import 'Guid.dart';

class OrderRepositoryInMemory implements IOrderRepository {
  final _orders = <Guid, Order>{};

  final ILogger logger;

  // Use constructor injection for the dependencies
  OrderRepositoryInMemory(this.logger);

  @override
  Order getById(Guid guid) {
    logger.log('Getting Order ' + guid.value);
    return _orders[guid] ?? Order.empty;
  }

  @override
  void save(Order order) {
    logger.log('Saving order ' + order.id);
    final guid = Guid(order.id);
    _orders[guid] = order;
  }
}
