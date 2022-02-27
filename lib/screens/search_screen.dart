import 'dart:math';
import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//This screen actually creates a delegate and it is not a screen. Delegate means
// like if we click on search the screen converts the app bar to search.
class SearchScreen extends SearchDelegate<CategoryModel> {
  ContentController contentController = Get.find();
  CategoryController categoryController = Get.find();

  CategoryModel? result;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: DASHBOARD_TEXT_COLOR,
        ),
      ),
      IconButton(
        onPressed: () {
          //Add filter
        },
        icon: const Icon(
          Icons.tune,
          color: loginbutton,
        ),
      ),
      const SizedBox(width: VS_SIZEDBOX_SIZE),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.chevron_left_rounded,
        size: BACK_BUTTON_ICON_SIZE,
        color: DASHBOARD_TEXT_COLOR,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionsForCategories = categoryController.categories.where(
        (element) =>
            element.searchKeywords.toLowerCase().contains(query.toLowerCase()));

    final suggestionsForContents = contentController.getContentList.where(
        (element) =>
            element.searchKeywords.toLowerCase().contains(query.toLowerCase()));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: GoogleFonts.lato(
                fontSize: CATEGORY_SIZE,
                fontWeight: CATEGORIES_TITLE__WEIGHT,
              ),
            ),
            const SizedBox(),
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(
            //         suggestionsForCategories.elementAt(index).name,
            //         style: GoogleFonts.lato(
            //           fontSize: SEE_ALL_SIZE,
            //           fontWeight: WORKOUTS_WEIGHT,
            //         ),
            //       ),
            //       subtitle: Text(
            //         '🧘 ${suggestionsForCategories.elementAt(index).contents?.length} excercise | ⏳ ${suggestionsForCategories.elementAt(index).totalDuration} min',
            //         style: GoogleFonts.lato(
            //           fontSize: 12,
            //         ),
            //       ),
            //       trailing: Container(
            //         padding: const EdgeInsets.all(20),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: suggestionsForCategories.elementAt(index).color,
            //         ),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (context, index) {
            //     return const Divider();
            //   },
            //   itemCount: suggestionsForCategories.length,
            // ),
            const SizedBox(height: 20),
            Text(
              'Videos/Posts',
              style: GoogleFonts.lato(
                fontSize: CATEGORY_SIZE,
                fontWeight: CATEGORIES_TITLE__WEIGHT,
              ),
            ),
            const SizedBox(),
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(
            //         suggestionsForContents.elementAt(index).name,
            //         style: GoogleFonts.lato(
            //           fontSize: SEE_ALL_SIZE,
            //           fontWeight: WORKOUTS_WEIGHT,
            //         ),
            //       ),
            //       subtitle: Text(
            //         '🧘 ${suggestionsForContents.elementAt(index).views} views | ⏳ ${suggestionsForContents.elementAt(index).duration} min',
            //         style: GoogleFonts.lato(
            //           fontSize: 12,
            //         ),
            //       ),
            //       trailing: Container(
            //         padding: const EdgeInsets.all(20),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //       ),
            //     );
            //   },
            //   separatorBuilder: (context, index) {
            //     return const Divider();
            //   },
            //   itemCount: suggestionsForContents.length,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsForCategories = categoryController.categories.where(
        (element) =>
            element.searchKeywords.toLowerCase().contains(query.toLowerCase()));

    final suggestionsForContents = contentController.getContentList.where(
        (element) =>
            element.searchKeywords.toLowerCase().contains(query.toLowerCase()));

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: suggestionsForCategories.isNotEmpty,
              child: Text(
                'Categories',
                style: GoogleFonts.lato(
                  fontSize: CATEGORY_SIZE,
                  fontWeight: CATEGORIES_TITLE__WEIGHT,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    suggestionsForCategories.elementAt(index).name,
                    style: GoogleFonts.lato(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: WORKOUTS_WEIGHT,
                    ),
                  ),
                  subtitle: Text(
                    '🧘 ${suggestionsForCategories.elementAt(index).contents?.length} excercises | ⏳ ${suggestionsForCategories.elementAt(index).totalDuration} mins',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: CATEGORY_RADIUS,
                    backgroundColor:
                        suggestionsForCategories.elementAt(index).color,
                    child: const SizedBox(
                      width: L_SIZEDBOX_SIZE,
                      /*child: Image.asset(
                        suggestionsForCategories.elementAt(index).icon,
                        fit: BoxFit.cover,
                      ),*/
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 01,
                );
              },
              itemCount: min(suggestionsForCategories.length, 3),
            ),
            Visibility(
              visible: suggestionsForCategories.isNotEmpty,
              child: const SizedBox(height: 20),
            ),
            Visibility(
              visible: suggestionsForContents.isNotEmpty,
              child: Text(
                'Videos/Posts',
                style: GoogleFonts.lato(
                  fontSize: CATEGORY_SIZE,
                  fontWeight: CATEGORIES_TITLE__WEIGHT,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    suggestionsForContents.elementAt(index).name,
                    style: GoogleFonts.lato(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: WORKOUTS_WEIGHT,
                    ),
                  ),
                  subtitle: Text(
                    '🧘 ${suggestionsForContents.elementAt(index).views} views | ⏳ ${suggestionsForContents.elementAt(index).duration} mins',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: CATEGORY_RADIUS,
                    backgroundColor: Colors.indigo[200],
                    child: SizedBox(
                      width: L_SIZEDBOX_SIZE,
                      child: Image.asset(
                        CATEGORY_FIRST_IMAGE_URL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 01,
                );
              },
              itemCount: suggestionsForContents.length,
            ),
          ],
        ),
      ),
    );
  }
}
