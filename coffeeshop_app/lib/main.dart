import 'package:coffeeshop_app/Appcolors.dart';
import 'package:coffeeshop_app/BottomBarDesign.dart';
import 'package:coffeeshop_app/CardDesign.dart';
import 'package:coffeeshop_app/CoffeeItem.dart';
import 'package:coffeeshop_app/OrderCardDesign.dart';
import 'package:coffeeshop_app/SearchBoxDesign.dart';
import 'package:coffeeshop_app/ShipDesign.dart';
import 'package:coffeeshop_app/Titleapp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, CoffeeItem> coffeeMap = {
  "001": CoffeeItem(
    title: "Latte",
    description: "Rich and warm",
    price: "17.50",
    icon: Icons.coffee_sharp,
  ),
  "002": CoffeeItem(
    title: "Espresso",
    description: "Strong and dark",
    price: "12.00",
    icon: Icons.local_cafe,
  ),
  "003": CoffeeItem(
    title: "Green tea",
    description: "Light and clean",
    price: "15.50",
    icon: Icons.coffee_sharp,
  ),
  "004": CoffeeItem(
    title: "Orange Juice",
    description: "Fresh pressed",
    price: "20.00",
    icon: Icons.coffee,
  ),
  "005": CoffeeItem(
    title: "Cappuccino",
    description: "Foam on top",
    price: "18.00",
    icon: Icons.coffee_sharp,
  ),
  "006": CoffeeItem(
    title: "Mint tea",
    description: "Cool finish",
    price: "14.00",
    icon: Icons.coffee,
  ),
};
void main() {
  runApp(const CoffeeMenu());
}

class CoffeeMenu extends StatelessWidget {
  const CoffeeMenu({super.key});

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
          title: TitleApp(Massege: "Good Morning", CustomerName: "Sara"),
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
                SearchBox(),
                Row(
                  spacing: 10,
                  children: [
                    choicesship(
                      text: "All",
                      isSelected: true,
                    ),
                    choicesship(
                      text: "Coffee",
                     isSelected: false,
                    ),
                    choicesship(
                      text: "Tea",
                      isSelected: false,
                    ),
                    choicesship(
                      text: "Juice",
                     isSelected: false,
                    ),
                    choicesship(
                      text: "water",
                      isSelected: false,
                    ),
                  ],
                ),
                OfferCard(Discount: '50%'),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8,
                  children: [
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "see all",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
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
                    CustomCard( coffeeItem: coffeeMap["001"]!),
                    CustomCard( coffeeItem: coffeeMap["002"]!),
                    CustomCard( coffeeItem: coffeeMap["003"]!),
                    CustomCard( coffeeItem: coffeeMap["004"]!),
                    CustomCard( coffeeItem: coffeeMap["005"]!),
                    CustomCard( coffeeItem: coffeeMap["006"]!),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}



