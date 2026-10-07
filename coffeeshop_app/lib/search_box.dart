import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController textEditingController ;
  final ValueChanged<String> onChanged;
  const SearchBox({
    required this.textEditingController ,
    required this.onChanged,
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
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: 'Search Your Drink ',
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
        ),
      ),
    );
  }
}