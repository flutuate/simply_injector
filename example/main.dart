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

main() {
  // 1. Create a new Simple Injector container
  var container = new SimplyInjector.Container();

  // 2. Configure the container (register)
  container.register<IOrderRepository, SqlOrderRepository>(
      () => new SqlOrderRepository(container.get<ILogger>()));
  container.register<ILogger, FileLogger>(
      () => new FileLogger(), Lifestyle.Singleton);
  container.register<IEventPublisher, EventPublisher>(
      () => new EventPublisher(), Lifestyle.Singleton);

  container.register<CancelOrderHandler, CancelOrderHandler>(() =>
      new CancelOrderHandler(container.get<IOrderRepository>(),
          container.get<ILogger>(), container.get<IEventPublisher>()));

  // 3. Verify your configuration
  //container.verify();

  // 4. Use the container
  var handler = container.get<CancelOrderHandler>();

  var args = ['0123456789'];
  var orderId = Guid.Parse(args[0]);
  var command = new CancelOrder(orderId);

  handler.Handle(command);
}
