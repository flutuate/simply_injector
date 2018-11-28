import 'OrderCancelled.dart';

abstract class IEventPublisher {
  void Publish(OrderCancelled command);
}
