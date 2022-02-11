import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'category.dart';


class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard(
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: CATEGORY_RADIUS,
          backgroundColor: category.color,
          child: SizedBox(
            width: L_SIZEDBOX_SIZE,
            child: Image.asset(
              category.catIcon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(category.catName)
      ],
    );
  }
}
