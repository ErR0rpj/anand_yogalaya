
import 'package:anand_yogalaya/screens/categoryScreens/category.dart';
import 'package:anand_yogalaya/screens/categoryScreens/category_card.dart';
import 'package:anand_yogalaya/screens/custom_app_bar.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        'Shoulder',
        'assets/images/yoga_1.png',
        kAccentGreen,
      ),
      Category(
        'Legs',
        'assets/images/yoga_2.png',
        kAccentRed,
      ),
      Category(
        'Back',
        'assets/images/yoga_3.png',
        kAccentYellow,
      ),
      Category(
        'Bicheps',
        'assets/images/yoga_4.png',
        kAccentPurple,
      ),
      Category(
        'Tricheps',
        'assets/images/yoga_5.png',
        kAccentTosca,
      ),
      Category(
        'Heart',
        'assets/images/yoga_6.png',
        kAccentGreen,
      ),
      Category(
        'Heart',
        'assets/images/yoga_1.png',
        kAccentRed,
      ),
      Category(
        'Heart',
        'assets/images/yoga_2.png',
        kAccentYellow,
      ),
      Category(
        'Heart',
        'assets/images/yoga_3.png',
        kAccentPurple,
      ),
      Category(
        'Heart',
        'assets/images/yoga_4.png',
        kAccentTosca,
      ),
      Category(
        'Heart',
        'assets/images/yoga_5.png',
        kAccentGreen,
      ),
      Category(
        'Heart',
        'assets/images/yoga_6.png',
        kAccentRed,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: LL_SIZEDBOX_SIZE,
            ),
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: CATEGORY_GRID_NUMBER,
              ),
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  categories[index],
                ),
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
