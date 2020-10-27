import 'package:simply_injector/simply_injector.dart';

import 'CancelOrder.dart';
import 'CancelOrderHandler.dart';
import 'EventPublisher.dart';
import 'FileLogger.dart';
import 'Guid.dart';
import 'IEventPublisher.dart';
import 'ILogger.dart';
import 'IOrderRepository.dart';
import 'SqlOrderRepository.dart';

void main() {
  // 1. Create a new Simple Injector container
  var container = SimplyInjector.Container();

  // 2. Configure the container (register)
  container.register<IOrderRepository, SqlOrderRepository>(
      () => SqlOrderRepository(container.get<ILogger>()));
  container.register<ILogger, FileLogger>(
      () => FileLogger(), Lifestyle.singleton);
  container.register<IEventPublisher, EventPublisher>(
      () => EventPublisher(), Lifestyle.singleton);

  container.register<CancelOrderHandler, CancelOrderHandler>(() =>
      CancelOrderHandler(container.get<IOrderRepository>(),
          container.get<ILogger>(), container.get<IEventPublisher>()));

  // 3. Verify your configuration
  //container.verify();

  // 4. Use the container
  var handler = container.get<CancelOrderHandler>();

  var args = ['0123456789'];
  var orderId = Guid.Parse(args[0]);
  var command = CancelOrder(orderId);

  handler.Handle(command);
}
