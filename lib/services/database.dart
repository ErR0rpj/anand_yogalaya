import 'package:anand_yogalaya/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
import '../models/user_model.dart';

class Database {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Creating User in DB
  Future<bool?> createNewUser(UserModel user) async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(user.id)
          .set({"name": user.name, "email": user.email});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Getting User from DB
  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firebaseFirestore.collection("users").doc(uid).get();

      return UserModel.fromSnapshot(_doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Getting all Category DocumentSnapshots in List of CategoryModel
  Stream<List<CategoryModel>> categoryStream() {
    print('Fetching categories from database');
    return _firebaseFirestore
        .collection("categories")
        .where('isPlayList', isEqualTo: false)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CategoryModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      }
      print('Retval: ${retVal.length}');
      return retVal;
    });
  }

  // Getting all Playlist(Category which have isPlaylist = true) DocumentSnapshots in List of CategoryModel
  Stream<List<CategoryModel>> playlistStream() {
    print('Fetching categories from database');
    return _firebaseFirestore
        .collection("categories")
        .where('isPlayList', isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CategoryModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      }
      print('Retval: ${retVal.length}');
      return retVal;
    });
  }

  // Getting all Content DocumentSnapshots in List of ContentModel
  Stream<List<ContentModel>> contentStream() {
    return _firebaseFirestore
        .collection("contents")
        .snapshots()
        .map((QuerySnapshot query) {
      List<ContentModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(ContentModel.fromDocumentSnapshot(element));
      }
      return retVal;
    });
  }

  // Getting selective Content's Document SnapShots according to categoryId
  Future<List<ContentModel>> generateContentList(String categoryId) async {
    var querySnapshot = await _firebaseFirestore
        .collection('contents')
        .where('categories', arrayContains: categoryId)
        .get();
    List<ContentModel> listCards = [];
    for (var doc in querySnapshot.docs) {
      try {
        listCards.add(ContentModel.fromDocumentSnapshot(doc));
      } catch (e) {
        print('Error generating list from content model: $e');
      }
    }
    return listCards;
  }
}
