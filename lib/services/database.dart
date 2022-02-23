import 'package:anand_yogalaya/models/contents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/categories.dart';
import '../models/user.dart';

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
    return _firebaseFirestore
        .collection("categories")
        .snapshots()
        .map((QuerySnapshot query) {
      List<CategoryModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      }
      return retVal;
    });
  }

  // Getting all Playlist(Category which have isPlaylist = true) DocumentSnapshots in List of CategoryModel
  Stream<List<CategoryModel>> playlistStream() {
    return _firebaseFirestore
        .collection("categories")
        .where('isPlayList', isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CategoryModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      }
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
      listCards.add(ContentModel.fromDocumentSnapshot(doc));
    }
    return listCards;
  }
}
