import 'package:anand_yogalaya/controllers/list_controllers.dart';
import 'package:anand_yogalaya/screens/categoryScreens/category_card.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListController listController = Get.find();

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
                listController.categoryList.length,
                (index) => CategoryCard(
                  listController.categoryList[index],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
