import 'package:flutter/material.dart';

class CoffeeItem {
  final String title;
  final String description;
  final String price;
  final IconData icon;
  final bool isSoldOut ;

  CoffeeItem({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
     this.isSoldOut=false,
  });
}