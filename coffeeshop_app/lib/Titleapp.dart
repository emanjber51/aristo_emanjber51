import 'package:coffeeshop_app/Appcolors.dart';
import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  final String Massege ;
  final String CustomerName ;
  const TitleApp({ required this.Massege, required this.CustomerName,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         Massege,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight(400),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          CustomerName,
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