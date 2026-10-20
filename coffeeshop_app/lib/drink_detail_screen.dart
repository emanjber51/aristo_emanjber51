import 'package:coffeeshop_app/add_to_order_button.dart';
import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/coffee_item.dart';
import 'package:coffeeshop_app/coffee_shots.dart';
import 'package:coffeeshop_app/order_item.dart';
import 'package:coffeeshop_app/size_box_design.dart';
import 'package:flutter/material.dart';

class DrinkDetailScreen extends StatefulWidget {
  final CoffeeItem coffee_item;
  const DrinkDetailScreen({super.key, required this.coffee_item});

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  DrinkSize selectedSize = DrinkSize.medium;
  int shots =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drink Details ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.chipUnselected,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                widget.coffee_item.icon,
                color: AppColors.primary,
                size: 80,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.coffee_item.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.coffee_item.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizeBoxDesign(
                  letter: DrinkSize.small.short,
                  isSelected: selectedSize == DrinkSize.small,
                  ontap: () {
                    setState(() {
                      selectedSize = DrinkSize.small;
                    });
                  },
                ),
                SizeBoxDesign(
                  letter: DrinkSize.medium.short,
                  isSelected: selectedSize == DrinkSize.medium,
                  ontap: () {
                    setState(() {
                      selectedSize = DrinkSize.medium;
                    });
                  },
                ),
                SizeBoxDesign(
                  letter: DrinkSize.large.short,
                  isSelected: selectedSize == DrinkSize.large,
                  ontap: () {
                    setState(() {
                      selectedSize = DrinkSize.large;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            if (widget.coffee_item.isCoffee)
              CoffeeShots(
                onDecrease: () {
                  setState(() {
                    if (shots > 0) {
                      shots--;
                    }
                  });
                },
                onIncrease: () {
                  setState(() {
                    if (shots < 3) {
                      shots++;
                    }
                  });
                },
                shots: shots,
              ),
            const SizedBox(height: 24),
            Text(
              "${totalPrice.toStringAsFixed(2)} EGP",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar :SafeArea(child: 
      Padding(padding: EdgeInsets.all(20),
      child: AddToOrderButton(onpressed: 
        widget.coffee_item.isSoldOut ? null :order_item  , label: "Add To Card ..",)  ,
        )
        )
       ) ; 
  }

  double get totalPrice {
    return widget.coffee_item.calculatePrice(selectedSize, shots);
  }
  void order_item(){
    OrderItem order =OrderItem(coffee_item: widget.coffee_item, size: selectedSize, shots: shots);
    Navigator.pop(context, order);
  }
}
