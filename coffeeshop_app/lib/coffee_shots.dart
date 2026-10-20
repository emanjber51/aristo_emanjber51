import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/button_design.dart';
import 'package:flutter/material.dart';

class CoffeeShots extends StatelessWidget {
  final VoidCallback onDecrease ;
  final VoidCallback onIncrease ;
  final int shots ;
  const CoffeeShots({super.key, required this.onDecrease, required this.onIncrease, required this.shots,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Extra shots",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonDesign(icons: Icons.remove , onpressed:  onDecrease,),
            Text(
              "$shots shots",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            ButtonDesign(icons: Icons.add,onpressed: onIncrease ,),

          ],
        ),
      ],
    );
  }
}

