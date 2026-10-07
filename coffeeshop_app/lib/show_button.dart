import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class ShowButton extends StatelessWidget {
  const ShowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Popular",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "see all",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
