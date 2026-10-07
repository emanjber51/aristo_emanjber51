import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/coffee_item.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final CoffeeItem coffeeItem;
  final VoidCallback onaddToCard;
  const CustomCard({super.key, required this.coffeeItem,required this.onaddToCard});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
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
              color: widget.coffeeItem.isSoldOut
                  ? Colors.grey[300]
                  : AppColors.chipUnselected,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                widget.coffeeItem.icon,
                size: 38,
                color: widget.coffeeItem.isSoldOut
                    ? const Color.fromARGB(174, 111, 78, 55)
                    : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.coffeeItem.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              widget.coffeeItem.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.coffeeItem.price}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.coffeeItem.isSoldOut
                      ? null
                      :widget.onaddToCard,
                  child: Container(
                    width: widget.coffeeItem.isSoldOut ? 70 : 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: widget.coffeeItem.isSoldOut
                          ? AppColors.surface
                          : AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: widget.coffeeItem.isSoldOut
                        ? const Text(
                            "Sold out",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
