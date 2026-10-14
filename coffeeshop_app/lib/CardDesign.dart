import 'package:coffeeshop_app/DiscountDesign.dart';
import 'package:coffeeshop_app/InfoTagDesign.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String Discount;

  const OfferCard({super.key, required this.Discount});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 140,
        width: double.infinity,
        color: Colors.brown[600],
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -40,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
            ),
            Positioned(
              right: 80,
              top: 70,
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Save',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: Discount,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        const TextSpan(
                          text: " on your first",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "order",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Row(
                    children: [
                      InfoBadge(text: "CODE Aresto"),
                      const SizedBox(width: 10),
                      InfoBadge(text: "Today only"),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 40,
              top: 35,
              child: DiscountBox(Discount: Discount),
            ),
          ],
        ),
      ),
    );
  }
}

