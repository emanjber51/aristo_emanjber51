# PART\_A

#### 1\. What does the late keyword do? When is it genuinely useful, and what can go wrong if you

#### use it carelessly?

##### The `late` Keyword in Dart

We use the **`late`** keyword when declaring a non-nullable variable that will definitely be assigned a value later before it is accessed. By using **`late`**, the compiler fully trusts the programmer to handle its initialization properly.

##### Best Use Cases:

1. **Dependent Variables**: When a variable depends on other variables or objects that are not yet initialized or will be created in other classes later in the lifecycle.
2. **Lazy Initialization**: When calculating the variable's value involves heavy or complex computations that should only run when the variable is actually accessed, rather than at declaration time.

##### Critical Risk:

Accessing or performing operations on a **`late`** variable before initializing it results in a severe runtime exception:

>`LateInitializationError: Field 'variable name' has not been initialized.`<



#### 2\. From the compiler's point of view, what is the difference between String and String?

#### What can you do with one that you cannot do with the other without extra work?

The distinction comes down to Dart's **Null Safety** system:



* **String (Non-nullable)**: Guarantees that the variable will always hold a valid text value and can **never** be `\\\\\\\\\\\\\\\*null\\\\\\\\\\\\\\\*`.
* **String?  (Nullable(:**  Indicated by the *`?`* operator, it means the variable can either hold a valid `\\\\\\\\\\\\\\\*String\\\\\\\\\\\\\\\*` or be explicitly set to null (optional data).

##### &#x20;Key Differences \& Usage Rules:

**1. Direct Assignability:**

&#x20;  - `String name = null;` **Compilation Error** (Not allowed).

&#x20;  - `String? name = null;`  **Allowed**.



**2. Accessing Properties and Methods**:

&#x20;  - Properties like `.length` or methods can be accessed directly on `String` (text. Length).

&#x20;  - For `String?`, direct access is restricted to prevent null-pointer errors. You must use the null-aware operator ?.(text?. Length`) or perform a null check first.



**3. Function Argument Passing:**

&#x20;  - A `String?` variable cannot be passed directly into a function parameter expecting a non-nullable `String` without type promotion, a default fallback operator (`??`), or the null assertion operator (`!`).



### 3\. What is a getter?

A **getter** in Dart is a special method that provides read-only access to a computed property. It behaves like a dynamic method internally (executing code every time it is read) but is accessed like a standard variable externally (without parentheses `()`).

###### Code Example from Coffee Shop Project:

In the `Order` class, calculating the total price of all items using a getter:

```dart
double get total Price {
  return drinks.fold(0.0, (sum, drink) => sum + drink.calculatePrice());
}





