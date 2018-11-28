import 'Order.dart';
import 'ILogger.dart';
import 'IOrderRepository.dart';
import 'Guid.dart';

class SqlOrderRepository implements IOrderRepository {
  final ILogger logger;

  // Use constructor injection for the dependencies
  SqlOrderRepository(this.logger);

  Order GetById(Guid guid) {
    logger.Log("Getting Order " + guid.value);
    return new Order(guid.value);
  }

  void Save(Order order) {
    this.logger.Log("Saving order " + order.Id);
    // Save to db.
  }
}
