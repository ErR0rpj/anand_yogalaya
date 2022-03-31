import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategories.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => Subcategory(
            categoryModel: category,
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            width: 90,
            height: 60,
            child: CircleAvatar(
              radius: CATEGORY_RADIUS,
              backgroundColor: category.color,
              child: Padding(
                padding: const EdgeInsets.all(SMALL_PAD),
                child: category.imageWidget,
              ),
            ),
          ),
          const SizedBox(
            height: S_SIZEDBOX_SIZE,
          ),
          SizedBox(
            width: 90,
            height: 30,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
