import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 /* @override
  void initState() {
    // set time to load the new page
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: LOGO_SIZE,
              width: LOGO_SIZE,
              child: Lottie.asset("assets/animations/girl_yoga.json"),
            ),
            const SizedBox(
              height: M_SIZEDBOX_SIZE,
            ),
            const Text(
              "ANAND YOGALYA",
              style: TextStyle(fontSize: ANAND_YOGALAYA_SIZE, fontWeight: ANAND_YOGALAYA_TEXT_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
