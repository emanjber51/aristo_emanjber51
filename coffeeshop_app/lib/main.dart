import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const Color pageBackground = Color(0xFFFDFBF9);

  static const Color surface = Color(0xFFFFFFFF);

  static const Color primary = Color(0xFF6F4E37);

  static const Color accent = Color(0xFFD9A066);

  static const Color textPrimary = Color(0xFF2B2118);

  static const Color textSecondary = Color(0xFF6F6156);

  static const Color chipUnselected = Color(0xFFF1EAE4);

  static const BoxShadow cardShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.06),
    blurRadius: 12,
    offset: Offset(0, 4),
  );
}

void main() {
  runApp(const Coffee_Menu());
}

class Coffee_Menu extends StatelessWidget {
  const Coffee_Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.pageBackground,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textPrimary),
          titleLarge: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Good Morning",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight(400),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Sara",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight(600),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.chipUnselected,
                child: Text(
                  'SA',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              children: [
                Container(
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
                ),
                Row(
                  spacing: 10,
                  children: [
                    choicesship(
                      text: "All",
                      textColor: Colors.white,
                      Backgroundcolor: Colors.brown,
                    ),
                    choicesship(
                      text: "Coffee",
                      textColor: Colors.brown,
                      Backgroundcolor: AppColors.chipUnselected,
                    ),
                    choicesship(
                      text: "Tea",
                      textColor: Colors.brown,
                      Backgroundcolor: AppColors.chipUnselected,
                    ),
                    choicesship(
                      text: "Juice",
                      textColor: Colors.brown,
                      Backgroundcolor: AppColors.chipUnselected,
                    ),
                    choicesship(
                      text: "water",
                      textColor: Colors.brown,
                      Backgroundcolor: AppColors.chipUnselected,
                    ),
                  ],
                ),
                OfferCard(Discount: '50%'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                    Text(
                      "see all",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CustomCard(
                      title: "Latte",
                      description: "Rich and warm",
                      price: "17.50",
                      icon: Icons.coffee_sharp,
                    ),
                    CustomCard(
                      title: "Espresso",
                      description: "Strong and small",
                      price: "12.00",
                      icon: Icons.coffee,
                    ),
                    CustomCard(
                      title: "Green tea",
                      description: "Light and clean",
                      price: "15.50",
                      icon: Icons.coffee_sharp,
                    ),
                    CustomCard(
                      title: "Orange Juice",
                      description: "Fresh pressed",
                      price: "20.00",
                      icon: Icons.coffee,
                    ),
                    CustomCard(
                      title: "Cappuccino",
                      description: "Foam on top",
                      price: "18.00",
                      icon: Icons.coffee_sharp,
                    ),
                    CustomCard(
                      title: "Mint tea",
                      description: "Cool finish",
                      price: "14.00",
                      icon: Icons.coffee,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary, // لون الأيقونة المحددة
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class choicesship extends StatelessWidget {
  final String text;
  final Color textColor, Backgroundcolor;

  const choicesship({
    super.key,
    required this.text,
    required this.textColor,
    required this.Backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Backgroundcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String Discount;

  const OfferCard({super.key, required this.Discount});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        // padding : EdgeInsets.all(12),
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
                      choicesship(
                        text: "CODE Aresto",
                        textColor: Colors.white,
                        Backgroundcolor: Colors.white.withOpacity(0.06),
                      ),
                      const SizedBox(width: 10),
                      choicesship(
                        text: "Today only",
                        textColor: Colors.white,
                        Backgroundcolor: Colors.white.withOpacity(0.06),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 40,
              top: 35,
              child: Transform.rotate(
                angle: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "-$Discount",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final IconData icon;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
  });

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
              color: AppColors.chipUnselected, // لون خلفية الصورة البيج
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 38,
                color: AppColors.primary, // لون الأيقونة البني
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight(600),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              description,
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
                price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
