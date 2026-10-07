import 'package:flutter/material.dart';

class CoffeeItem {
  final String title;
  final String description;
  final double price;
  final IconData icon;
  final String category ;
   int quentity ; 

  CoffeeItem({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
     required this.category ,
     this.quentity=10 , 
  });
 bool  get isSoldOut => quentity <=0 ;
}