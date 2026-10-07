import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  final String massage ;
  final String customername ;
  const TitleApp({ required this.massage, required this.customername,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         massage,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight(400),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          customername,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight(600),
          ),
        ),
      ],
    );
  }
}