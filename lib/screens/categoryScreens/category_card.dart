import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;

  const CategoryCard(this.category, {Key? key}) : super(key: key);

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
              category.icon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(category.name)
      ],
    );
  }
}
