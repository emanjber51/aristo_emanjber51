import 'package:flutter/material.dart';

class CoffeeItem {
  final String title;
  final String description;
  final String price;
  final IconData icon;

  CoffeeItem({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
  });
}