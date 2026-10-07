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