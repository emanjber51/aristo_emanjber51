# Part C 

##### 1\. Where did you split your widgets, and why there? Pick one widget you extracted and explain 

##### what would break, or become annoying, if you had left it inline in the main build method.

&#x20; **Reusable Widget** 

&#x20;   choicesship(

&#x20;                     text: "All",

&#x20;                     textColor: Colors.white,

&#x20;                     Backgroundcolor: Colors.brown,

&#x20;                   ),

I split my layout by extracting repetitive UI elements—specifically the category selection chips—into a dedicated `choicesship` widget. 



If I had left this code inline inside the main `*build*` method, it would have resulted in heavy code duplication across the category list, leading to a cluttered and deeply nested widget tree. Any minor styling change (such as adjusting padding or border radius) would have required manual updates in multiple places, making the code error-prone and hard to maintain.

&#x20;            

By encapsulating the `*Container*` decoration logic and exposing properties (`*text*`, `*text Color*`, and `*backgroundColor*`), I successfully applied the DRY (Don't Repeat Yourself) principle. This approach significantly reduced boilerplate code, improved readability, and ensured that the main screen remains clean and focused solely on layout architecture.



##### 2\. Expanded, Flexible, and SizedBox — what does each one do? Give an example of each 

##### from your own submission, or explain where you would have used it if you did not.



**Expanded** ==>

&#x20;It forces the elements to expand and fill all the remaining space. If I were implementing this in my code, instead of using a grid, I would create a row containing two `*Expanded*` widgets each holding a `*CustomCard*` and arrange these rows within a column.  

**Flexible==>**

&#x20;Gives a child element the flexibility to occupy only the space it needs according to its content, without forcing the parent layout to expand fully. In my coffee app, I would use `*Flexible*` around the coffee title/description text inside the `*CoffeeCard*` widget. This ensures that long coffee description shrink gracefully and adapt within the available space without overflowing or pushing the price label off-screen.

&#x20; Flexible(

&#x20;           child: Text(

&#x20;             description,

&#x20;             style: Theme.of(context).textTheme.bodyMedium?.copyWith(

&#x20;               color: AppColors.textSecondary,

&#x20;               fontSize: 12,

&#x20;               fontWeight: FontWeight(400),

&#x20;             ),

&#x20;           ),

&#x20;         ),

**SizedBox==>**

"I used it to establish consistent spacing between elements specifically between column items and list items. If I wanted a fixed gap for aesthetic purposes, I could simply use a SizedBox and specify a fixed size."

Column(

&#x20;           children: \[

&#x20;             Text(

&#x20;               "Good Morning",

&#x20;                 ),

&#x20;             **const SizedBox(height: 10),**

&#x20;             Text(

&#x20;               "Sara",

&#x20;                 ),

&#x20;           ],

&#x20;         ),

