# Part B — Refactor your own screen

### Take your week 2 code and clean it. Same screen, same design, nothing new on the surface.

##### **1. One widget per file. DrinkCard, CategoryChip, SearchField, OfferCard,**

##### **GreetingRow, BottomBar — each in its own file, named after it**

##### **.**

* **One widget per file:**



I have structured the project following the modular architecture principle by placing each widget and data model into its own dedicated file named after its purpose. This separation improves code readability, maintainability, and reusability across the application.



The refactored file structure is organized as follows:



*Appcolors.dart:* Global app color palette *(AppColors).*



*CoffeeItem.dart:* Data model for coffee items *(CoffeeItem)*.



*BottomBarDesign.dart:* Navigation bar component *(BottomNavigationBar).*



*CardDesign.dart:* Offer card component *(OfferCard).*



*DiscountDesign.dart:* Discount badge widget *(DiscountBox).*



*InfoTagDesign.dart*: Information tag badge *(InfoBadge).*



*OrderCardDesign.dart:* Main coffee item card *(CustomCard).*



*SearchBoxDesign.dart:* Search bar component *(SearchBox).*



*ShipDesign.dart:* Category selection chips *(choicesship)*.



*show\_button.dart:* Action button component *(ShowButton)*.



*Titleapp.dart:* App title header component *(TitleApp).*



By isolating each component into its own file, the main codebase remains clean, concise, and easy to navigate.



##### 

##### **2. Your cards take data, not hard-coded text. If you wrote six card widgets with "Latte" and**

##### **"Espresso" typed inside them, that is the main thing to fix. Make one DrinkCard that takes a**

##### **name, a subtitle and a price. Then build a small class to hold a drink's data — you already know**

##### **how, you did exactly this in week 1.**

**2. Data-Driven Cards:**



I refactored the cards to use a data-driven approach instead of hard-coded text:



* Created a Data Model (*CoffeeItem*): I created a class to hold all properties for each drink, such as name, description, price, and icon.



* Updated CustomCard Widget: The card widget no longer uses fixed text. Instead, it accepts a *CoffeeItem* object as a parameter and displays its data dynamically.



* Stored Data in a Map: I stored all drinks in a Map<String, *CoffeeItem*>, making it very easy to pass items into CustomCard and add new *menu items without modifying the UI layout.*

*Map<String, CoffeeItem> coffeeMap = {*

&#x20; *"001": CoffeeItem(*

&#x20;   *title: "Latte",*

&#x20;   *description: "Rich and warm",*

&#x20;   *price: "17.50",*

&#x20;   *icon: Icons.coffee\_sharp,*

&#x20; *),*

&#x20; *"002": CoffeeItem(*

&#x20;   *title: "Espresso",*

&#x20;   *description: "Strong and dark",*

&#x20;   *price: "12.00",*

&#x20;   *icon: Icons.local\_cafe,*

&#x20; *),};*

&#x20;                   ***CustomCard( coffeeItem: coffeeMap\["001"]!),***



##### **3. The grid is built from a list. Keep your drinks in a List, and build the cards from it instead**

##### **of writing each one out by hand. Look up .map() and .toList() if you have not used them**

##### **on widgets yet.**



**Building the Grid Dynamically from Data:**



Instead of manually repeating multiple CustomCard widgets in the layout, I rendered them dynamically directly from the coffee data:



*Stored all drink entries inside a structured Map<String, CoffeeItem>.*



*Iterated dynamically over the Map items to build each CustomCard directly on demand.*



*This approach removes redundant code and ensures the UI automatically updates whenever a new drink is added to the data map.*





##### **4. Every colour and text style comes from the theme. If a hex code still appears anywhere**

##### **outside your theme file, move it.**



**Theme and Style Centralization:**



I centralized all application colors and styling to maintain a consistent design system and eliminate duplicate hard-coded values:



* Moved all color hex codes and color definitions into the dedicated AppColors.dart file.



* Replaced every hard-coded color in the UI widgets with its corresponding reference from AppColors (e.g., AppColors.primary, AppColors.surface, AppColors.textSecondary).



* Ensured that no direct hex codes appear outside the styling file, making design updates fast, clean, and centralized across the entire application.









