import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
    final IconData icons ;

  const ButtonDesign({
    super.key,
    required this.icons, required this.onpressed,
  });

  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onpressed,
        icon: Icon( icons, size: 30, color: AppColors.surface),
      ),
    );
  }
}
