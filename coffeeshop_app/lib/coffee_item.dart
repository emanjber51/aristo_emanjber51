import 'package:flutter/material.dart';

class CoffeeItem {
  final String title;
  final String description;
  final double price;
  final IconData icon;
  final String category;
  int quentity;
  final bool isCoffee;

  CoffeeItem({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.category,
    this.quentity = 10,
    required this.isCoffee,
  });
  bool get isSoldOut => quentity <= 0;
  double calculatePrice(DrinkSize size , int shots) {
    return price*size.multiplier + shots*5;
  }
}

enum DrinkSize {
  small(label: 'Small', multiplier: 1.0, short: 'S'),
  medium(label: 'Medium', multiplier: 1.25, short: 'M'),
  large(label: 'Large', multiplier: 1.5, short: 'L');

  final String label;
  final String short;
  final double multiplier;

  const DrinkSize({
    required this.label,
    required this.multiplier,
    required this.short,
  });
}
