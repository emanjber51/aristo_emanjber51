import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class SizeBoxDesign extends StatelessWidget {
  final String letter;
  final bool isSelected;
  final VoidCallback ontap;
  const SizeBoxDesign({
    super.key,
    required this.letter,
    required this.isSelected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.chipUnselected,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              letter,
              style: TextStyle(
                color:isSelected? AppColors.surface : AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
