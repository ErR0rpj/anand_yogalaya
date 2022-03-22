import 'package:anand_yogalaya/models/content_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../utils/firebase_const.dart';

class UploadFormController extends GetxController {
  uploadForm(ContentModel contentModel) async {
    String contentId = const Uuid().v4();
    try {
      await firebaseFirestore.collection("contents").doc(contentId).set({
      'id' : contentId,
      'name' : contentModel.name,
      'description' : contentModel.description,
      'photoUrl' : contentModel.photoUrl,
      'videoUrl' : contentModel.videoUrl,
      'duration' : contentModel.duration,
      'isPremium' : contentModel.isPremium,
      'searchKeywords' : "",
      'views' : 0,
      'addedDate' : DateTime.now(),
      'categories' : contentModel.categories,
      'likes' : []
      });
    } catch (e) {
      print(e);
    }
  }
}
