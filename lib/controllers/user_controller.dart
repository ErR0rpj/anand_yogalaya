import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  //Disposes the controller manually.
  void clear() {}
}
