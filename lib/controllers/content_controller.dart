import 'package:anand_yogalaya/controllers/auth_controller.dart';
import 'package:anand_yogalaya/controllers/user_controller.dart';
import 'package:anand_yogalaya/models/content_model.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class ContentController extends GetxController {
  // ContentList Controller
  Rx<List<ContentModel>> contentList = Rx<List<ContentModel>>([]);
  // Getter for content list
  List<ContentModel> get getContentList => contentList.value;

  //List for contents of a particular category
  Rx<List<ContentModel>> categoryContentList = Rx<List<ContentModel>>([]);
  List<ContentModel> get getCategoryContentList => categoryContentList.value;

  //Visible list on popular section in trending page.
  Rx<List<ContentModel>> popularContentList = Rx<List<ContentModel>>([]);
  List<ContentModel> get getPopularContentList => popularContentList.value;

  //Visible list on liked section in trending page.
  Rx<List<ContentModel>> newContentList = Rx<List<ContentModel>>([]);
  List<ContentModel> get getNewContentList => newContentList.value;

  //Visible list on liked section in trending page.
  Rx<List<ContentModel>> likedContentList = Rx<List<ContentModel>>([]);
  List<ContentModel> get getLikedContentList => likedContentList.value;

  @override
  void onInit() {
    try {
      print('Fetching content from database');
      contentList.bindStream(Database().contentStream());
    } catch (e) {
      print('Error fetching content: $e');
    }
  }

  //Fetches the content for a particular category like meditation.
  Future<List<ContentModel>> fetchContentForCategory(String categoryId) async {
    getCategoryContentList.clear();

    for (int i = 0; i < getContentList.length; i++) {
      for (int j = 0; j < getContentList[i].categories!.length; j++) {
        if (getContentList[i].categories![j].trimLeft().trimRight() ==
            categoryId.trimLeft().trimRight()) {
          getCategoryContentList.add(getContentList[i]);
        }
      }
    }
    return getCategoryContentList;
  }

  static int popularComparison(ContentModel? a, ContentModel? b) {
    final propertyA = a!.views;
    final propertyB = b!.views;
    if (propertyA < propertyB) {
      return 1;
    } else if (propertyA > propertyB) {
      return -1;
    } else {
      return 0;
    }
  }

  static int dateAddedComparison(ContentModel? a, ContentModel? b) {
    final propertyA = a!.addedDate;
    final propertyB = b!.addedDate;
    return propertyB!.compareTo(propertyA!);
  }

  // list sorted on popularity.
  Future<List<ContentModel>> fetchPopularContent() async {
    print('Fetching Popular Content');
    getPopularContentList.clear();

    getPopularContentList.addAll(getContentList);
    getPopularContentList.sort(popularComparison);

    return getPopularContentList;
  }

  // list sorted on popularity.
  Future<List<ContentModel>> fetchNewContent() async {
    print('Fetching New Content');
    getNewContentList.clear();

    getNewContentList.addAll(getContentList);
    getNewContentList.sort(dateAddedComparison);

    return getNewContentList;
  }

  // list sorted on popularity.
  Future<List<ContentModel>> fetchLikedContent() async {
    print('Fetching Liked Content');
    getLikedContentList.clear();

    getLikedContentList.addAll(getContentList);

    return getLikedContentList;
  }
}
