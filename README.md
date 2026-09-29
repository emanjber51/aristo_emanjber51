# aristo_emanjber51
## How to run it
Run `flutter pub get` in the terminal, then run `flutter run` using an emulator or a connected physical device.
## The Five Widgets
1. **Stack + Positioned :**  Places widgets on top of each other and controls their exact position  Used in OfferCard to layer background circles and place the -50% tag at the top right.
2. **ClipRRect:** Clips its child with smooth rounded corners to keep content inside the boundaries Used in OfferCard to round the card corners
3. **Transform.rotate :** Rotates any widget by a specific angle to create dynamic designs  Used in OfferCard to tilt the discount badge for a stylish look.
4. **Text.rich with TextSpan :** Displays a single block of text with multiple different styles and fonts  Used in OfferCard to combine normal text with bold discount percentages in one line.
5. **Wrap** Arranges items in a row and automatically pushes extra items to the next line to prevent overflow Used for the promo code pills (Popular / see all) to adapt to narrow screens.
## Decisions
* I split the Coffee Item Card into a separate custom widget to make the code clean, readable, and reusable across the list.
* I chose to use a SingleChildScrollView instead of a static Column so the menu can scroll smoothly on smaller screen sizes without overflowing.
* I used SizedBox with fixed height/width for spacing between components to keep consistent margins across the screen , And to control the layout of the fields and columns specifically their positioning relative to each other and the spacing between them...
## Struggles
* **yellow/black bottom overflow** I struggled with an error when adding the coffee items. I didn't understand why it happened at first, but after reading about layout constraints, I solved it by wrapping the layout in a SingleChildScrollView.
* **Git & Pull Requests:** I struggled with understanding Git workflows and opening a Pull Request for the first time. Getting used to branches, staging, and pushing changes was a bit confusing, but following the process step-by-step helped me grasp it.
* **ThemeData:** It was my first time working with ThemeData to set up app styling and color schemes globally instead of hardcoding them, which took some time to learn and apply properly.
* **RichText & TextSpan:** Using RichText and TextSpan to format different parts of a single text block with distinct styles (like bolding prices or changing colors) was challenging at first, but it gave me much better design control once I mastered it.