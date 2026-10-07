import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class DiscountBox extends StatelessWidget {
  const DiscountBox({
    super.key,
    required this.discount,
  });

  final String discount;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Text(
          "-$discount",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
      ),
    );
  }
}