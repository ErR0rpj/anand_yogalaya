import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../TopWorkoutScreens/topWorkout.dart';
import '../bottomNavigationScreens/homeScreen.dart';

class Uploadpostform extends StatefulWidget {
  const Uploadpostform({Key? key}) : super(key: key);

  @override
  _UploadpostformState createState() => _UploadpostformState();
}

class _UploadpostformState extends State<Uploadpostform> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Donebutton,
        ),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
             Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: SubcategoryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: L_SIZEDBOX_SIZE,),
                            Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 20,
                                color: kblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          //  SizedBox(width: 150,),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 350.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextField(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 2.0,
                                    color: Colors.black
                                )
                            )
                        ),
                        Row(
                          children: [
                            SizedBox(width: L_SIZEDBOX_SIZE,),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 20,
                                color: kblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 350.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextField(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 2.0,
                                    color: Colors.black
                                )
                            )
                        ),
                        Row(
                          children: [
                            SizedBox(width: L_SIZEDBOX_SIZE,),
                            Text(
                              "Video Url",
                              style: TextStyle(
                                fontSize: 20,
                                color: kblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 350.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextField(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 2.0,
                                    color: Colors.black
                                )
                            )
                        ),
                        Row(
                          children: [
                            SizedBox(width: L_SIZEDBOX_SIZE,),
                            Text(
                              "Image Url",
                              style: TextStyle(
                                fontSize: 20,
                                color: kblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 350.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextField(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 2.0,
                                    color: Colors.black
                                )
                            )
                        ),
                        Row(
                          children: [
                            SizedBox(width: L_SIZEDBOX_SIZE,),
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 20,
                                color: kblack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: 350.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),

                          child: TextField(
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 2.0,
                                    color: Colors.black
                                )
                            )
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: DONE_BUTTON_TOP_PAD,
                              left: DONE_BUTTON_LEFT_PAD,
                              right: DONE_BUTTON_RIGHT_PAD),
                          child: Column(
                            children: <Widget>[
                              DoneButton(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
             ),
          ],
        ),
      ),
    );
  }
}


Widget DoneButton(BuildContext context) {
  return Container(
    height: 55,
    width:  300,
    child: FlatButton(
      color: Donebutton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 3.0),
          Center(
            child: Text('Upload',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: DONE_BUTTON_SIZE,
                )),
          )
        ],
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomepageScreen()),
        ),
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    ),
  );
}

