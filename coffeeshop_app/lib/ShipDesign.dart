import 'package:coffeeshop_app/Appcolors.dart';
import 'package:flutter/material.dart';

class choicesship extends StatelessWidget {
  final String text;
  final bool isSelected ;
  const choicesship({
    super.key,
    required this.text,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color:isSelected ? Colors.brown : AppColors.chipUnselected,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.brown,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
