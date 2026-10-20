import 'package:coffeeshop_app/coffee_item.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final CoffeeItem coffee_item;
  final DrinkSize size;
  final int shots;
  double get total_price => coffee_item.calculatePrice(size, shots);
  const OrderItem({
    super.key,
    required this.coffee_item,
    required this.size,
    required this.shots,
  });


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
