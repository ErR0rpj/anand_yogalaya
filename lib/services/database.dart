
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
      query.docs.forEach((element) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  // Getting selective Content's Document SnapShots
  Future<List<ContentModel>> generateContentList(String categoryId) async {
    var querySnapshot = await _firebaseFirestore.collection('contents').where('categories', arrayContains: categoryId).get();
    List<ContentModel> listCards = [];
    querySnapshot.docs.forEach((doc) {
      listCards.add(
        ContentModel(
            id: doc.data()['id'],
            name: doc.data()['name'],
            duration: doc.data()['duration'],
            videoUrl: doc.data()['videoUrl']
        )
      );
    });
    return listCards;
  }



}
