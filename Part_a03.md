##### 1\. Single Responsibility "A class should have one reason to change." Explain what that means in your own words. Then look at your week 2 code and find one widget that had more than one reason to change. Name it and say what the two reasons were.

&#x20; **GridView.count(**

&#x20;                 **crossAxisCount: 2,**

&#x20;                 **crossAxisSpacing: 16,**

&#x20;                 **mainAxisSpacing: 16,**

&#x20;                 **childAspectRatio: 0.75,**

&#x20;                 **padding: const EdgeInsets.all(16),**

&#x20;                 **physics: const BouncingScrollPhysics(),**

&#x20;                 **shrinkWrap: true,**

&#x20;                 **children: \[**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["001"]!),**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["002"]!),**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["003"]!),**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["004"]!),**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["005"]!),**

&#x20;                   **CustomCard( coffeeItem: coffeeMap\["006"]!),**

&#x20;                 **],**

&#x20;               **),**





***" Refactored CustomCard to accept a single CoffeeItem object instead of separate primitive variables, improving type safety and code cleanliness. Additionally, stored coffee items in a Map structure to streamline adding new drinks and facilitate dynamic UI rendering."***



##### 2\. Open / Closed "Open for extension, closed for modification." What does that mean in practice? Give one example from a coffee shop app — anything, it does not have to be code you wrote.

***Open for extension:***

&#x20;*By adding the variable defined within `choicesship` you have prepared the widget to accept new states (selected/unselected) and alter its appearance; when you later convert it to a `StatefulWidget` and use `setState`, the widget will expand to become fully interactive.*

&#x20;**Closed for modification:**

&#x20;*Other parts and screens utilizing this widget are not required to handle its specific rendering or coloring logic, as the widget itself now fully adheres to the `isSelected` state.* 

&#x20;Widget build(BuildContext context) {

&#x20;   return Container(

&#x20;     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

&#x20;     decoration: BoxDecoration(

&#x20;       color:isSelected ? Colors.brown : AppColors.chipUnselected,

&#x20;       borderRadius: BorderRadius.circular(12),

&#x20;     ),

&#x20;     child: Text(

&#x20;       text,

&#x20;       style: TextStyle(

&#x20;         color: isSelected ? Colors.white : Colors.brown,

&#x20;         fontSize: 13,

&#x20;         fontWeight: FontWeight.w600,

&#x20;       ),

&#x20;     ),

&#x20;   );

&#x20; }



##### 3\. From last week's reading "Constraints go down. Sizes go up. Parent sets position." Explain that sentence as if you were teaching it to someone who has never opened Flutter. 

##### Use one example from your own screen.

**Container(**

&#x20;           **height: 110,**

&#x20;           **width: double.infinity,**

&#x20;           **decoration: BoxDecoration(**

&#x20;             **color: AppColors.chipUnselected,** 

&#x20;             **borderRadius: BorderRadius.circular(15),**

&#x20;           **),**

&#x20;           **child: Center(**

&#x20;             **child: Icon(**

&#x20;               **coffeeItem.icon,**

&#x20;               **size: 38,**

&#x20;               **color: AppColors.primary,** 

&#x20;             **),**

&#x20;           **),**

&#x20;         **),**

**In OrderCardDesign Class \\\\** 

**Constraints go down:** The *Container* enforces a( height of 110 and double.infinity width), passing these boundary constraints down through Center to the Icon.



**Sizes go up:** The *Icon* determines its exact required size (size: 38) based on its property and reports this size back up to its parent (Center).



**Parent sets position:** The *Center* widget positions the 38px icon directly in the middle of the available container space, while the Container applies the background decoration (BorderRadius.circular(15))."



