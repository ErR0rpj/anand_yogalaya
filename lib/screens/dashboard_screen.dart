import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkout.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/searchScreen.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/categoryScreens/category_screen.dart';
import 'package:anand_yogalaya/screens/custom_app_bar.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

import 'categoryScreens/category.dart';
import 'categoryScreens/category_card.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      const Category(
        CATEGORY_FIRST,
        CATEGORY_FIRST_IMAGE_URL,
        kAccentGreen,
      ),
      const Category(
        CATEGORY_SECOND,
        CATEGORY_SECOND_IMAGE_URL,
        kAccentRed,
      ),
      const Category(
        CATEGORY_THIRD,
        CATEGORY_THIRD_IMAGE_URL,
        kAccentYellow,
      ),
      const Category(
        CATEGORY_FOURTH,
        CATEGORY_FOURTH_IMAGE_URL,
        kAccentPurple,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: appPadding * 2),
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(
              height: L_SIZEDBOX_SIZE,
            ),
            CategoryTab(categories: categories),
            const SizedBox(
              height: L_SIZEDBOX_SIZE,
            ),
            Workouts(),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: S_MEDIUM_PAD,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: CATEGORY_SIZE,
                    fontWeight: CATEGORIES_TITLE__WEIGHT,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: SEEALL_WEIGHT,
                      color: SEE_ALL_COLOR),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(categories[index]),
            ),
          )
        ],
      ),
    );
  }
}
