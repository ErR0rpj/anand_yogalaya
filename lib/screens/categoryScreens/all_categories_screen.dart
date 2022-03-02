import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/screens/categoryScreens/category_card.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Notifications/notificationAppbar.dart';
import '../Notifications/notificationbackButton.dart';

class AllCategoriesScreen extends StatelessWidget {
  final CategoryController categoryController = Get.find();
  AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const DefaultAppBar(
        title: 'All Categories',
        child: DefaultBackButton(),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 10,
          top: 15,
          right: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories (${categoryController.getCategoryList.length})',
              style: GoogleFonts.lato(
                fontSize: CATEGORY_SIZE,
                fontWeight: CATEGORIES_TITLE__WEIGHT,
                color: kblack,
              ),
            ),
            const SizedBox(height: M_SIZEDBOX_SIZE),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: CATEGORY_GRID_NUMBER,
                ),
                children: List.generate(
                  categoryController.getCategoryList.length,
                  (index) => CategoryCard(
                    categoryController.getCategoryList[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: L_SIZEDBOX_SIZE),
            Text(
              'Categories (${categoryController.getCategoryList.length})',
              style: GoogleFonts.lato(
                fontSize: CATEGORY_SIZE,
                fontWeight: CATEGORIES_TITLE__WEIGHT,
                color: kblack,
              ),
            ),
            const SizedBox(height: M_SIZEDBOX_SIZE),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: CATEGORY_GRID_NUMBER,
                ),
                children: List.generate(
                  categoryController.getPlaylistList.length,
                  (index) => CategoryCard(
                    categoryController.getPlaylistList[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
