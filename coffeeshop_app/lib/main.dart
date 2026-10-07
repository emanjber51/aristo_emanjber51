import 'package:coffeeshop_app/app_colors.dart';
import 'package:coffeeshop_app/bottom_bar.dart';
import 'package:coffeeshop_app/coffee_item.dart';
import 'package:coffeeshop_app/empty_result.dart';
import 'package:coffeeshop_app/offer_card.dart';
import 'package:coffeeshop_app/custom_card.dart';
import 'package:coffeeshop_app/search_box.dart';
import 'package:coffeeshop_app/choice_ship.dart';
import 'package:coffeeshop_app/title_app.dart';
import 'package:coffeeshop_app/coffee_map.dart';
import 'package:coffeeshop_app/show_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CoffeeMenu());
}

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});

  @override
  State<CoffeeMenu> createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  int selectedCategoryIndex = 0;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";
    List<CoffeeItem> itemsTobuy = [];
  @override
  Widget build(BuildContext context) {
    final List<CoffeeItem> filteredProducts = coffeeMap.values.where((item) {
      final bool matchesCategory =
          selectedCategoryIndex == 0 ||
          item.category == categories[selectedCategoryIndex];

      final String query = searchQuery.toLowerCase().trim();

      final bool matchesSearch =
          query.isEmpty || item.title.toLowerCase().contains(query);

      return matchesCategory && matchesSearch;
    }).toList();


    double totalPrice() {
      double total = 0.0;
      for (CoffeeItem item in itemsTobuy) {
        total += item.price;
      }
      return total;
    }

    void addToCard(CoffeeItem coffeeitem) {
      if (coffeeitem.quentity > 0) {
        setState(() {
          itemsTobuy.add(coffeeitem);
          coffeeitem.quentity--;
        });
      }
    }

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
          title: TitleApp(massage: "Good Morning", customername: "Sara"),
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
                SearchBox(
                  textEditingController: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ChoiceShip(
                        text: categories[index],
                        isSelected: selectedCategoryIndex == index,
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
                OfferCard(discount: '50%'),
                ShowButton(),
                filteredProducts.isEmpty
                    ? EmptyResult()
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.75,
                            ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final drink = filteredProducts[index];
                          return CustomCard(coffeeItem: drink , onaddToCard: () => addToCard(drink),);
                        },
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(countItem: itemsTobuy.length,totalprice: totalPrice(),),
      ),
    );
  }
}
