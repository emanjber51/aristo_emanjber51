# aristo_emanjber51
### How to run it
Run `flutter pub get` in the terminal, then run `flutter run` using an emulator or a connected physical device.
## Week 02

### The Five Widgets
1. **Stack + Positioned :**  Places widgets on top of each other and controls their exact position  Used in OfferCard to layer background circles and place the -50% tag at the top right.
2. **ClipRRect:** Clips its child with smooth rounded corners to keep content inside the boundaries Used in OfferCard to round the card corners
3. **Transform.rotate :** Rotates any widget by a specific angle to create dynamic designs  Used in OfferCard to tilt the discount badge for a stylish look.
4. **Text.rich with TextSpan :** Displays a single block of text with multiple different styles and fonts  Used in OfferCard to combine normal text with bold discount percentages in one line.
5. **Wrap** Arranges items in a row and automatically pushes extra items to the next line to prevent overflow Used for the promo code pills (Popular / see all) to adapt to narrow screens.

### Decisions
* I split the Coffee Item Card into a separate custom widget to make the code clean, readable, and reusable across the list.
* I chose to use a SingleChildScrollView instead of a static Column so the menu can scroll smoothly on smaller screen sizes without overflowing.
* I used SizedBox with fixed height/width for spacing between components to keep consistent margins across the screen , And to control the layout of the fields and columns specifically their positioning relative to each other and the spacing between them...
### Struggles
* **yellow/black bottom overflow** I struggled with an error when adding the coffee items. I didn't understand why it happened at first, but after reading about layout constraints, I solved it by wrapping the layout in a SingleChildScrollView.
* **Git & Pull Requests:** I struggled with understanding Git workflows and opening a Pull Request for the first time. Getting used to branches, staging, and pushing changes was a bit confusing, but following the process step-by-step helped me grasp it.
* **ThemeData:** It was my first time working with ThemeData to set up app styling and color schemes globally instead of hardcoding them, which took some time to learn and apply properly.
* **RichText & TextSpan:** Using RichText and TextSpan to format different parts of a single text block with distinct styles (like bolding prices or changing colors) was challenging at first, but it gave me much better design control once I mastered it.

## Week 03 

### Decisions
1. **Widget Extraction for Bottom Bar (`ShowButton`):**
   Extracted the `BottomNavigationBar` logic from `main.dart` into a standalone widget called `ShowButton` (inside `show_button.dart`). This keeps `main.dart` clean, reduces code duplication, and improves modularity.

2. **Extensibility & Open-Closed Principle:**
   Added two new drinks to the data map and passed them as items to `CustomCard` to test the layout's flexibility. This adheres to the **Open/Closed Principle** (Open for extension, closed for modification), proving that new items can be introduced seamlessly without altering or breaking the core card logic.

3. **Horizontal Category Scrolling:**
   Introduced two new categories to evaluate dynamic content additions. Wrapped the category container in a `SingleChildScrollView` with a horizontal scroll direction (`scrollDirection: Axis.horizontal`) to handle overflow and ensure a smooth user experience across varying screen widths.

4. **Dynamic Item State (`isSoldOut`):**
   Implemented an `isSoldOut` boolean flag along with conditional rendering to dynamically update the UI representation of a drink when it is out of stock (e.g., toggling styling, badges, or button states).
### Struggles
1. **Category Overflow Issue:**
   When adding new categories, a black-and-yellow strip overflow error occurred. After researching online, I resolved the issue by wrapping the container in a `SingleChildScrollView` with `scrollDirection: Axis.horizontal` to enable horizontal scrolling.

2. **Git Workspace Directory Error:**
   I encountered difficulties when trying to switch branches and save changes because I was executing Git commands from an inner subfolder. I solved this by navigating back to the root project directory, which allowed Git to properly track all files and branches.

3. **Layout Overflow in Section Header:**
   The row containing the "Popular" and "See All" text labels broke visually on mobile devices due to improper `Wrap` constraints. I refactored the section to use a `Row` widget with `MainAxisAlignment.spaceBetween` to ensure proper alignment and spacing across screen sizes.

## week 4

### Decisions
* I identified and resolved all issues in the code, renamed files to adhere to standard naming conventions, and replaced `withOpacity` with `withValues` (available in the Color class).
* I added several drinks to the menu to test the code's flexibility and observe the screen's behavior when switching between displayed items; I also added a "No drinks found" message for cases where a search is performed for a non-existent drink.
* When I started modifying the code, I initially made the `ChoiceShip` class a `StatefulWidget`. However, after finishing the UI and reviewing the code, I realized that only the main class needed to be `Stateful`, so I opted to make the remaining classes `Stateless` instead.
 
 ### Struggles
 
* One of the most difficult and frustrating tasks is tracking functions across widgets and passing a function through multiple intermediaries until it reaches the intended class.
* The difficulty of detecting a `setState` error and identifying the cause of the page's unresponsiveness to user interaction.

## week 5 

### What it is
The coffee application allows users to easily specify their order type, size, and the number of espresso shots. It clearly displays prices, enables users to review order details on a dedicated page, and facilitates the final purchase through a checkout page.

### Architecture
* `itemsTobuy` resides within `_CoffeeMenuState` and represents the list of drinks I intend to purchase. When the button in the bottom navigation bar is clicked, I pass this list to the checkout screen, along with the `addToCart` function, to display the selected items.

* Initially, if the search box or category chips are not being used, the `filteredProducts` variable—a list of `CoffeeItem` objects—contains all the drinks available on the menu. These drinks are displayed using a grid, where the number of items in the grid matches the number of elements in the `filteredProducts` list. Each item is rendered via a `CustomCard` component. One of the parameters passed to this `CustomCard` is an `onTap` callback, which triggers navigation to a details screen that displays information about the specific drink that was tapped.

* The FakeOrderService lives in lib/services/fake_order_service.dart. It only simulates a server: it waits two seconds, then either returns an order number or throws an exception (when the cart is empty or the total is over 150 EGP). It does not hold any state itself.

* The checkout state lives in _CartScreenState, because the cart screen is the one that changes depending on it. It has three variables: isLoading shows a spinner on the button and blocks a second tap while the request is running, errorMessage stores the failure message (for example when the order is over 150 EGP), and orderNumber stores the number of a successful order.

* When “Place order” is tapped, the screen sets isLoading to true, then calls the service with await inside a try/catch/finally. On success it saves the order number and clears the cart; on failure it saves the error message so the user can fix the cart and try again. The finally block always sets isLoading back to false, so the button never stays disabled. Before every setState after the await, I check mounted, so the app does not crash if the user leaves the screen while it is loading.

###  What I changed from the design

* I did not change anything regarding the design, and I adhered to the rules.


### What I’d do next

* If you would like to further enhance the application, I can add more interfaces. This could include a splash screen that appears when the app is opened, as well as separate screens for user login and new customer registration. Additionally, I can incorporate a screen where customers can submit suggestions—whether for new app features, modifications, or improvements to product quality.

### Struggles 

* The thing that confused me most was tracking how the order list moves between screens. At first, I did not know how to connect it to the cart screen, and I did not understand how to send the user’s choices (size and extra shots) back from the details screen to the menu so the customized drink could be added to the order.

* It clicked when I understood that the menu owns the list and passes it to the other screens through the constructor, so the cart edits the same list. The details screen builds an OrderItem and returns it with Navigator.pop, and the menu receives it with await Navigator.push and adds it inside setState.

* Another challenge was showing the extra shots only for coffee. I solved it by adding an isCoffee attribute to the CoffeeItem class, so the details screen can check it and show the shots widget only for coffee drinks.