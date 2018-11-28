import 'IOrderRepository.dart';
import 'ILogger.dart';
import 'IEventPublisher.dart';
import 'CancelOrder.dart';
import 'OrderCancelled.dart';
import 'OrderStatus.dart';

class CancelOrderHandler {
  final IOrderRepository repository;
  final ILogger logger;
  final IEventPublisher publisher;

  // Use constructor injection for the dependencies
  CancelOrderHandler(this.repository, this.logger, this.publisher);

  void Handle(CancelOrder command) {
    this.logger.Log("Cancelling order " + command.OrderId.toString());
    var order = this.repository.GetById(command.OrderId);
    order.Status = OrderStatus.Cancelled;
    this.repository.Save(order);
    this.publisher.Publish(new OrderCancelled(command.OrderId));
  }
}
