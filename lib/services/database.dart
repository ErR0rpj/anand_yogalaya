
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/categories.dart';
import '../models/user.dart';

class Database {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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


  Future<void> addTodo(String content, String uid) async {
    try {
      await _firebaseFirestore.collection("users").doc(uid).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
        // 'title' : title,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<CategoryModel>> todoStream() {
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


  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateOne(
      String newcontentValue, String uid, String todoId) async {
    try {
      _firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"content": newcontentValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  deleteOne(String uid, String todoId) async {
    try{
      _firebaseFirestore.collection("users").doc(uid).collection("todos").doc(todoId).delete();
    }
    catch(e){print(e);
    rethrow;
    }

  }


}
