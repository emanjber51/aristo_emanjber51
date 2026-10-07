### Part\_a04

##### **1. How do you decide whether a widget should be StatelessWidget or StatefulWidget? Give one widget from your own screen that stays stateless even after this week's changes, and say why.**



We use a `**StatelessWidget**` when the page remains static—without any user interaction or screen gestures and for elements designed solely for display.

We use a `**StatefulWidget**` when we want to design a screen that interacts with user actions and whose elements change such as when tapping on text, a box, an icon, or a button.

The `**DiscountBox**` class does not need to be a `**StatefulWidget**` because it is designed solely to display the discount figure, not to trigger changes on the page.



##### **2. What does setState actually do? Specifically: if you change a variable inside State without calling setState, what happens to the variable, and what happens to the screen?**



`**setState**` holds the state of the current page and the build function; when called, it rebuilds the page to reflect the changes that have occurred.

When the value of a variable is changed without calling `**setState**`, its value in memory updates normally; however, absolutely no change occurs in the user interface, and the displayed value of the variable remains the same.



##### **3. Your + button is inside DrinkCard. The order total is shown in the bottom bar. Those are two different widgets, and neither one is inside the other. Where does the order have to live, and why can it not live inside the card?**



The order data must be stored within *an internal list—specifically*, the item code and the order summary (such as the number of items and the total price displayed in the bottom bar). When the **"+"** button for a drink is clicked, that drink is added to the list; the item's code and price are then transferred to this list. The order data should not reside within the **"+"** button itself, as that button is designed for a single item; instead, the list acts as a "shopping cart" where multiple drink orders can be stored.





