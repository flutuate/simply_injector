import 'IEventPublisher.dart';
import 'OrderCancelled.dart';

class EventPublisher implements IEventPublisher {
  @override
  void Publish(OrderCancelled command) {
    print('Command $command published!');
  }
}
