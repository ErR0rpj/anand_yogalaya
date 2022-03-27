import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../utils/const.dart';
import '../utils/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthController authController = Get.put(AuthController());
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: authController.checkUserLoggedIn(),
        builder: (BuildContext context,AsyncSnapshot snapshot) {

          if (snapshot.hasError) {
            return Scaffold(
              //backgroundColor: Styles.primaryColor,
              body: Center(child: LoadingWidget()),
            );
          }
          if (snapshot.hasData) {
            return snapshot.data;
          }

        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: size.height * 0.5,
                    width: LOGO_SIZE,
                    child: Image.asset("assets/images/logo.png")
                ),
                const SizedBox(
                  height: M_SIZEDBOX_SIZE,
                ),
                const Text(
                  "ANAND YOGALAYA",
                  style: TextStyle(fontSize: ANAND_YOGALAYA_SIZE, fontWeight: ANAND_YOGALAYA_TEXT_COLOR),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
