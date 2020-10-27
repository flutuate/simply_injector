import 'Order.dart';
import 'ILogger.dart';
import 'IOrderRepository.dart';
import 'Guid.dart';

class SqlOrderRepository implements IOrderRepository {
  final ILogger logger;

  // Use constructor injection for the dependencies
  SqlOrderRepository(this.logger);

  @override
  Order getById(Guid guid) {
    logger.log('Getting Order ' + guid.value);
    return Order(guid.value);
  }

  @override
  void save(Order order) {
    logger.log('Saving order ' + order.Id);
    // Save to db.
  }
}
