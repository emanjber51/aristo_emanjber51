import 'package:coffeeshop_app/order_item.dart';

class Order {
  final List<OrderItem> items;
  int get itemCount => items.length;
  double get total {
    double total0 = 0;
    for (OrderItem order in items) {
      total0 += order.total_price;
    }
    return total0;
  }

  const Order({required this.items});
}
