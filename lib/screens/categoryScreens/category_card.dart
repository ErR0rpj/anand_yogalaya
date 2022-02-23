import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 60,
          child: CircleAvatar(
            radius: CATEGORY_RADIUS,
            backgroundColor: category.color,
            child: Padding(
              padding: const EdgeInsets.all(SMALL_PAD),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: category.imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        const SizedBox(height: S_SIZEDBOX_SIZE,),
        Container(
            width: 90,
            height: 30,
            child: Text(
            category.name,textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
              maxLines: 2,
            )
        )
      ],
    );
  }
}
