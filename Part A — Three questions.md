### Part A — Three questions

##### **1. What is a Future? Explain it to someone who has never written async code. Then: what does await actually do to the function it is written inside?**

A **`Future`** is an object representing a result that is not yet ready—an operation that takes time and will complete in the future. For example, when you order a meal at a restaurant, you receive a receipt and wait for your food. A `Future` has three states: it can be pending (waiting), succeed (returning your result/data), or fail with an error.

The **`await`** keyword pauses the execution of the function it is inside until the `Future` completes—without blocking the rest of the application. It extracts the underlying value from the `Future`, and if an error occurs, `await` passes that error to a `try/catch` block to prevent the app from crashing.

Finally, any function that uses the `await` keyword must be marked with **`async`**.





##### **2. Your menu screen owns the order. The cart screen needs to show it, and the detail screen needs to add to it. Neither of those screens is inside the menu screen's widget tree in the way DrinkCard was. So how does the order reach them? Describe your approach before you build it.**



The Menu function (or class) contains a list of purchased items. When navigating to the cart from the button at the bottom of the page, we pass this list to it via a constructor defined in the Cart class, using `Navigator.push` to navigate to the next screen.



Through the Cart screen, I can remove any unwanted drink, and any deletion or modification will be applied directly to the same list instance.



Any updates made to a drink from the Details screen will return via `Navigator.pop(context, drink)`. The Menu opens the Details screen using `await Navigator.push(...)`.



As for the Details screen, tapping on an order card navigates to it, displaying the drink's data along with details such as the number of shots, price, and size, as well as an option to purchase and add the drink to the Menu's shopping list.



Thus, navigation to the Details screen occurs by passing the `CoffeeItem` element, which changes depending on which item's details screen was opened, while keeping a consistent UI design.



Finally, the state update is performed by the Menu class using `setState`, since it is the owner of the state, thereby updating its own data.



##### **3. A user taps "Place order". It takes two seconds. During those two seconds they tap it again. What happens, and what should happen? Be specific about what you will do to prevent the bad version.**

###### **1. The Issue: Unhandled Double Tapping**

* Repeatedly tapping the button triggers the `placeOrder` function multiple times concurrently before the initial asynchronous operation completes.
* **Practical Consequence:** Creates duplicate orders for the same cart and results in double charging the user—a critical flaw in production systems.

###### 2\. Expected Behavior

* Accept only the initial tap while ignoring subsequent interactions during the pending operation.
* Display a loading indicator to inform the user that the request is currently being processed.

###### 3\. Implementation and Prevention Strategy

1. **State Flag:** Declare a boolean flag (e.g., `isSubmitting = false`) to track the execution status.
2. **State Update Prior to `await`:** Set `isSubmitting = true` within `setState` immediately upon interaction to block further input.
3. **Button Disabling and Loading UI:**

   * Pass `onPressed: isSubmitting ? null : \_placeOrder` to automatically disable the button.
   * Render a `CircularProgressIndicator` instead of the button text during processing.
4. **Resilient Error Handling (`try/catch/finally`):** Reset `isSubmitting = false` within a `finally` block to guarantee button reactivation regardless of success or failure.
5. **Lifecycle Verification (`mounted` Check):** Verify `if (mounted)` prior to invoking `setState` following the `await` expression to prevent memory leaks and exceptions if the widget unmounts during execution.

