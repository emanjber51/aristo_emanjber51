import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class ChoiceShip extends StatelessWidget {
  final String text;
  final bool isSelected ;
  final VoidCallback onTap;
  const ChoiceShip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
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
      ),
    );
  }
}
