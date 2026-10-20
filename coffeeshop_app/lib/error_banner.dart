
import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  final String Massege ; 
  const ErrorBanner({super.key, required this.Massege});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.errorPanel,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline,color: AppColors.errorText,),
          const SizedBox(width: 8,),
          Expanded(child: Text(
            Massege , style: TextStyle(color: AppColors.errorText),
          ))
        ],
      ),
    );
  }
}