import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/category_model.dart';
import '../services/database.dart';

class CategoryController extends GetxController {
  // CategoryList Controller
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);
  // Getter for category list
  List<CategoryModel> get getCategoryList => categoryList.value;

  // Playlists
  Rx<List<CategoryModel>> playList = Rx<List<CategoryModel>>([]);
  // Getter for playlists
  List<CategoryModel> get getPlaylistList => playList.value;

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
