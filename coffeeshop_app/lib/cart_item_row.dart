import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/order_item.dart';
import 'package:flutter/material.dart';

class CartItemRow extends StatelessWidget {
  final OrderItem order;
  final VoidCallback onRemove;
  const CartItemRow({super.key, required this.order, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    String details = order.size.label;
    if (order.shots > 0) {
      details += ' • ${order.shots} shots';
    };
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            spreadRadius: 0.04,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.chipUnselected,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              order.coffee_item.icon,
              size: 28,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.coffee_item.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${order.total_price.toStringAsFixed(2)} | EJP",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          IconButton(onPressed: onRemove, icon: Icon(Icons.delete , color: AppColors.textSecondary,)),
        ],
      ),
    );
  }
}
