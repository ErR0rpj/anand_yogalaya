import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/category_model.dart';
import '../services/database.dart';

class CategoryController extends GetxController {

  // All CategoryList Controller
  Rx<List<CategoryModel>> allCategoryList = Rx<List<CategoryModel>>([]);
  // Getter for all category list
  List<CategoryModel> get getAllCategoryList => allCategoryList.value;

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
      allCategoryList.bindStream(Database().allCategoryStream());
      categoryList.bindStream(Database().categoryStream());
      playList.bindStream(Database().playlistStream());
    } catch (e) {
      print(e);
    }
  }
}
