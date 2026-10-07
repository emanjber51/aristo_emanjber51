import 'package:coffeeshop_app/app_colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int countItem;
  final double totalprice;
  const BottomBar({
    super.key,
    required this.countItem,
    required this.totalprice,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.shopping_bag),
              if (countItem > 0) 
              Positioned(
                right: -20,
                 left: -10,
                 child: Container(
                    padding:  EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      shape: BoxShape.circle,
                    ),
                    constraints:  BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    child: Text(
                      '$countItem',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                ),
              
            ],
          ),
          label: countItem > 0
              ? '\$$totalprice for items '
              : 'Cart',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
