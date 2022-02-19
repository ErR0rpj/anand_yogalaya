import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/categories.dart';
import '../services/database.dart';
import '../utils/firebase_const.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);

  List<CategoryModel> get categories => categoryList.value;

  @override
  void onInit() {
    try{
      categoryList
          .bindStream(Database().categoryStream());

    }catch(e){
      print(e);
    }
  }
}
