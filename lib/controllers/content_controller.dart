import 'package:anand_yogalaya/models/contents.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class ContentController extends GetxController{
  // ContentList Controller
  Rx<List<ContentModel>> contentList = Rx<List<ContentModel>>([]);
  // Getter for content list
  List<ContentModel> get contents => contentList.value;


  @override
  void onInit() {
    try {
      contentList.bindStream(Database().contentStream());
    } catch (e) {
      print(e);
    }
  }
}