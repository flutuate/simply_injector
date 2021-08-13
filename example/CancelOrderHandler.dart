import 'IOrderRepository.dart';
import 'ILogger.dart';
import 'IEventPublisher.dart';
import 'CancelOrder.dart';
import 'Order.dart';
import 'OrderCancelled.dart';
import 'OrderStatus.dart';

class CancelOrderHandler {
  final IOrderRepository repository;
  final ILogger logger;
  final IEventPublisher publisher;

  // Use constructor injection for the dependencies
  CancelOrderHandler(this.repository, this.logger, this.publisher);

  void Handle(CancelOrder command) {
    logger.log('Cancelling order ' + command.OrderId.toString());
    var order = repository.getById(command.OrderId);
    order = Order(order.id, OrderStatus.cancelled);
    repository.save(order);
    publisher.Publish(OrderCancelled(command.OrderId));
  }
}
