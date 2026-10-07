### Part\_c04

1. ##### How many widgets does a value pass through without using it, just to reach the one that needs it?

**addToCardlde method** Created in CoffeeMenu (the main screen).



The widget you actually need and use for the press action is CustomCard (specifically, inside the InkWell button).

It is passed to the `itemBuilder` of the `GridView.builder` and into the `CustomCard` class, enabling the addition of purchased drinks to the list when the "Add" button is clicked.

**The `totalPrice()` method** was created in `CoffeeMenu` to calculate the total cost of purchased drinks; it is then passed to the `BottomBar` to display the purchase details on the cart icon.

##### 2\. If we added a second screen — a cart page showing the same order — what would you have to change?

When adding a new screen, **I add the item to the shopping cart;** clicking the cart icon takes the user to a page displaying its contents (the purchase invoice). This requires passing the contents of the `itemsTobuy` list to the final page, displaying them, and including a button to confirm the purchase.

##### 3.What was the most annoying part of wiring this up?

* One of the most difficult and frustrating tasks is tracking functions across widgets and passing a function through multiple intermediaries until it reaches the intended class.
* The difficulty of detecting a `setState` error and identifying the cause of the page's unresponsiveness to user interaction.



