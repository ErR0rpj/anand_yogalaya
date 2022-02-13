import 'package:anand_yogalaya/screens/bottomNavigationScreens/homeScreen.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:anand_yogalaya/utils/firebase_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginbackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Anand Yogalaya',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.merriweather(
                        fontWeight: LOGIN_WORKOUT_TEXT_COLOR,
                        color: Colors.black,
                        fontSize: LOGIN_WORKOUT_TEXT,
                      ),
                    ),
                    const SizedBox(height: S_SIZEDBOX_SIZE),
                    Text(
                      'Dont miss the Fitness!!',
                      style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: S_SIZEDBOX_SIZE),
                    SizedBox(
                      height: LOGO_SIZE,
                      width: LOGO_SIZE,
                      child: Lottie.asset(
                        "assets/animations/girl_yoga.json",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: LARGE_SIZEDBOX_SIZE),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: loginbutton,
      ),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/Glogo.png"),
            const SizedBox(width: 3.0),
            Text(
              'Login with Google',
              style: GoogleFonts.montserrat(
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: () {
          authController.signInWithGoogle();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomepageScreen(),
          //   ),
          // ),
        },
      ),
    );
  }
}
