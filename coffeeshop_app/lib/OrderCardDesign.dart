import 'package:coffeeshop_app/Appcolors.dart';
import 'package:coffeeshop_app/CoffeeItem.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final CoffeeItem coffeeItem;
  const CustomCard({super.key, required this.coffeeItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: coffeeItem.isSoldOut
                  ? Colors.grey[300]
                  : AppColors.chipUnselected,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                coffeeItem.icon,
                size: 38,
                color: coffeeItem.isSoldOut
                    ?  const Color.fromARGB(174, 111, 78, 55)
                    : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            coffeeItem.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight(600),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              coffeeItem.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight(400),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                coffeeItem.price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                width: coffeeItem.isSoldOut ? 70 : 32,
                height: 32,
                decoration: BoxDecoration(
                  color: coffeeItem.isSoldOut ? AppColors.surface : AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: coffeeItem.isSoldOut
                    ? const Text(
                        "Sold out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
