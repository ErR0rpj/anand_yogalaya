import 'package:anand_yogalaya/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // set time to load the new page
    Future.delayed(Duration(seconds: 1), (){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment:  Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              width: 500,
              child: Lottie.asset("assets/animations/girl_yoga.json"),
            ),
            SizedBox(height: 20,),
            Text(
              "ANAND YOGALYA",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
