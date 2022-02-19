import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/user.dart';

class UserController extends GetxController {
  Rx<UserModel?> _userModel = UserModel().obs;

  UserModel get user => _userModel.value!;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
  _userModel.value = UserModel();
  }

}
