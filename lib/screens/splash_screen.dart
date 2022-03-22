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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              "ANAND YOGALYA",
              style: TextStyle(fontSize: ANAND_YOGALAYA_SIZE, fontWeight: ANAND_YOGALAYA_TEXT_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
