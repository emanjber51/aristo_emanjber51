import 'package:coffeeshop_app/add_to_order_button.dart';
import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/cart_item_row.dart';
import 'package:coffeeshop_app/error_banner.dart';
import 'package:coffeeshop_app/order_item.dart';
import 'package:coffeeshop_app/success_banner.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop_app/services/fake_order_service.dart';
import 'package:coffeeshop_app/order.dart';

class CartScreen extends StatefulWidget {
  final List<OrderItem> items;
  const CartScreen({super.key, required this.items});

  @override
  State<CartScreen> createState() => _CartScreenState();

  double totalPrice() {
    double total = 0;
    for (OrderItem item in items) {
      total += item.total_price;
    }
    return total;
  }
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  String? errorMessage, orderNumber;
  Future<void> placeOrder() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
      errorMessage = null;
        orderNumber = null;

    });
    try {
      final order = Order(items: widget.items);
      final number = await FakeOrderService().placeOrder(order);
      if (!mounted) return;
      setState(() {
        orderNumber = number;
        widget.items.clear();
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart...",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: widget.items.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (orderNumber != null) ...[
                    SuccessBanner(Massege: orderNumber!),
                    const SizedBox(height: 20),
                  ],
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.textSecondary,
                    size: 70,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Your Cart is Empty",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: widget.items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CartItemRow(
                  order: widget.items[index],
                  onRemove: () => setState(() {
                    widget.items.removeAt(index);
                  }),
                ),
              ),
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (errorMessage != null) ...[
                ErrorBanner(Massege: errorMessage!),
                const SizedBox(height: 12),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Items  ${widget.items.length}",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 0.7, color: AppColors.primary),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Totals  ${widget.totalPrice()} | EGP",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AddToOrderButton(
                label: "Place Order",
                onpressed: (widget.items.isEmpty || isLoading)
                    ? null
                    : placeOrder,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
