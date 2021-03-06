import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/firebase_const.dart';

class UploadFormController extends GetxController {
  Future<bool> addCategoryForm(CategoryModel categoryModel) async {
    try {
      WriteBatch batch = firebaseFirestore.batch();

      batch.set(
          firebaseFirestore.collection('categories').doc(categoryModel.id),
          categoryModel.toMap());

      batch.commit();

      return true;
    } catch (e) {
      print('Error uploading form: $e');
      return false;
    }
  }

  Future<bool> uploadForm(ContentModel contentModel) async {
    try {
      WriteBatch batch = firebaseFirestore.batch();

      batch.set(firebaseFirestore.collection('contents').doc(contentModel.id),
          contentModel.toMap());

      for (int i = 0; i < contentModel.categories!.length; i++) {
        batch.update(
            firebaseFirestore
                .collection('categories')
                .doc(contentModel.categories![i]),
            {
              'contents': FieldValue.arrayUnion([contentModel.id])
            });
      }

      batch.commit();

      return true;
    } catch (e) {
      print('Error uploading form: $e');
      return false;
    }
  }

  Future<bool> markContentDeleted(ContentModel contentModel) async {
    try {
      await firebaseFirestore
          .collection('contents')
          .doc(contentModel.id)
          .update({
        'isDeleted': true,
      });
      return true;
    } catch (e) {
      print('Error marking content delted: $e');
      return false;
    }
  }

  Future<bool> updateForm(ContentModel contentModel) async {
    try {
      WriteBatch batch = firebaseFirestore.batch();

      batch.update(
          firebaseFirestore.collection('contents').doc(contentModel.id),
          contentModel.toMap());

      for (int i = 0; i < contentModel.categories!.length; i++) {
        batch.update(
            firebaseFirestore
                .collection('categories')
                .doc(contentModel.categories![i]),
            {
              'contents': FieldValue.arrayUnion([contentModel.id])
            });
      }

      batch.commit();

      return true;
    } catch (e) {
      print('Error uploading form: $e');
      return false;
    }
  }
}
