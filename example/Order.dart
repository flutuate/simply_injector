import 'OrderStatus.dart';

class Order {
  final String Id;

  OrderStatus Status;

  Order(this.Id, {this.Status = OrderStatus.Cancelled});
}
