import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/categories.dart';
import '../services/database.dart';
import '../utils/firebase_const.dart';

class CategoryController extends GetxController {
  // CategoryList Controller
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  // Getter for category list
  List<CategoryModel> get categories => categoryList.value;

  // Playlists
  Rx<List<CategoryModel>> playList = Rx<List<CategoryModel>>([]);
  // Getter for playlists
  List<CategoryModel> get playlists => playList.value;

  @override
  void onInit() {
    try {
      categoryList.bindStream(Database().categoryStream());
      playList.bindStream(Database().playlistStream());
    } catch (e) {
      print(e);
    }
  }
}
