import 'package:anand_yogalaya/screens/dashboard_screen.dart';
import 'package:anand_yogalaya/utils/const.dart';
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
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(00.0, 120.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Text(
                            'Workout',
                            style: GoogleFonts.merriweather(
                              fontWeight: LOGIN_WORKOUT_TEXT_COLOR,
                              color: Colors.black,
                              fontSize: LOGIN_WORKOUT_TEXT,
                            ),
                          ),
                          const SizedBox(height: S_SIZEDBOX_SIZE),
                          Text(
                            'Dont miss the fitness!!',
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
                                "assets/animations/girl_yoga.json"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: LARGE_SIZEDBOX_SIZE),
                      loginButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget loginButton(BuildContext context) {
    return Container(
      height: 65,
      child: FlatButton(
        color: loginbutton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset("assets/images/Glogo.png"),
              ),
            ),
            const SizedBox(width: 3.0),
            Center(
              child: Text('Login with Google',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  )),
            )
          ],
        ),
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DashBoardScreen()),),
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
