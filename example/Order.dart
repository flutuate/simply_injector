import 'OrderStatus.dart';

class Order {
  static const empty = _EmptyOrder();

  final String id;
  final OrderStatus status;

  const Order(this.id, this.status);
}

class _EmptyOrder extends Order {
  const _EmptyOrder() : super('', OrderStatus.cancelled);
}
