import 'package:anand_yogalaya/models/content_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/firebase_const.dart';

class UploadFormController extends GetxController {
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
