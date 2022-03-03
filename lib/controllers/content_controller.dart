import 'package:anand_yogalaya/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../services/database.dart';
import '../utils/firebase_const.dart';

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
    super.onInit();

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

  // like particular content with id
  likeContent(ContentModel contentModel) async {
    var uid = authController.user?.uid;
    DocumentSnapshot likedDoc = await firebaseFirestore.collection('contents').doc(contentModel.id).get();
    //DocumentSnapshot userLikedDoc = await firebaseFirestore.collection('users').doc(uid).get();


    if ((likedDoc.data()! as dynamic)['likes'].contains(uid)) {

      await firebaseFirestore.collection('contents').doc(contentModel.id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
      await firebaseFirestore.collection('users').doc(uid).update({
        'contentLikedByUser': FieldValue.arrayRemove([contentModel.id]),
      });
      contentModel.likes?.remove(uid);

    } else {
      await firebaseFirestore.collection('contents').doc(contentModel.id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
      await firebaseFirestore.collection('users').doc(uid).update({
        'contentLikedByUser': FieldValue.arrayUnion([contentModel.id]),
      });
      contentModel.likes?.add(uid);
    }
    update();
  }

}
