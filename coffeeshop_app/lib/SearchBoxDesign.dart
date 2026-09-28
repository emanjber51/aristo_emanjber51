import 'package:coffeeshop_app/Appcolors.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [AppColors.cardShadow],
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          hintText: 'Search Your Drink ',
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight(400),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
        ),
      ),
    );
  }
}