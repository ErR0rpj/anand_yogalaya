import 'dart:math';
import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/screens/contentScreen/contentScreen.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategories.dart';
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

  //This code is same as below buildSuggestion function. So, make apt changes in both.
  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchUI(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchUI(context);
  }

  //Build the lists of searched items
  Widget _buildSearchUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Builds the list for categories and adds categories which are searched
    final List<CategoryModel> suggestionsForCategories = categoryController
        .getCategoryList
        .where((element) =>
            element.searchKeywords.toLowerCase().contains(query.toLowerCase()))
        .toList();
    //Adds playlists which are searched to existing categories list.
    suggestionsForCategories.addAll(categoryController.getPlaylistList.where(
        (element) => element.searchKeywords
            .toLowerCase()
            .contains(query.toLowerCase())));

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
                'Categories (${suggestionsForCategories.length})',
                style: GoogleFonts.lato(
                  fontSize: CATEGORY_SIZE,
                  fontWeight: CATEGORIES_TITLE__WEIGHT,
                  color: kblack,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => Subcategory(
                        categoryModel:
                            suggestionsForCategories.elementAt(index),
                      ),
                    );
                  },
                  title: Text(
                    suggestionsForCategories.elementAt(index).name,
                    style: GoogleFonts.lato(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: WORKOUTS_WEIGHT,
                    ),
                  ),
                  subtitle: Text(
                    '🧘 ${suggestionsForCategories.elementAt(index).contents?.length} excercises | ⏳ ${suggestionsForCategories.elementAt(index).totalDuration!} mins',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                    ),
                  ),
                  trailing: CircleAvatar(
                    radius: CATEGORY_RADIUS,
                    backgroundColor:
                        suggestionsForCategories.elementAt(index).color,
                    child: Padding(
                      padding: const EdgeInsets.all(SMALL_PAD),
                      child:
                          suggestionsForCategories.elementAt(index).imageWidget,
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
                'Videos/Posts (${suggestionsForContents.length})',
                style: GoogleFonts.lato(
                  fontSize: CATEGORY_SIZE,
                  fontWeight: CATEGORIES_TITLE__WEIGHT,
                  color: kblack,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => ContentScreen(
                        content: suggestionsForContents.elementAt(index),
                      ),
                    );
                  },
                  title: Text(
                    suggestionsForContents.elementAt(index).name,
                    style: GoogleFonts.lato(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: WORKOUTS_WEIGHT,
                    ),
                  ),
                  subtitle: Text(
                    '👁️ ${suggestionsForContents.elementAt(index).views} views | ⏳ ${suggestionsForContents.elementAt(index).duration!} mins',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Container(
                    width: size.width * 0.15,
                    height: size.height * 0.070,
                    decoration: BoxDecoration(
                      color: suggestionsForContents.elementAt(index).color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: suggestionsForContents.elementAt(index).imageWidget,
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
