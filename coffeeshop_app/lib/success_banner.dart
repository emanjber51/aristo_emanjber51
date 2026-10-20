
import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessBanner extends StatelessWidget {
  final String Massege ; 
  const SuccessBanner({super.key, required this.Massege});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.successPanel,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline,color: AppColors.successText,),
          const SizedBox(width: 8,),
          Expanded(child: Text(
            Massege , style: TextStyle(color: AppColors.successText),
          ))
        ],
      ),
    );
  }
}