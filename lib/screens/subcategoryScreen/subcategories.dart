import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../TopWorkoutScreens/topWorkout.dart';
import 'subcategorylist.dart';

class Subcategory extends StatefulWidget {
  const Subcategory({Key? key}) : super(key: key);

  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Donebutton,
          image: new DecorationImage(
            alignment: Alignment.center,
            image: new AssetImage("assets/images/yoga_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: ARROW_BACK_TOP_PAD,
                  left: ARROW_BACK_LEFT_PAD,
                  right: ARROW_BACK_RIGHT_PAD),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: BACK_BUTTON_ICON_SIZE,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: SubcategoryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: L_SIZEDBOX_SIZE,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: L_SIZEDBOX_SIZE,
                      ),
                      Text(
                        "Meditation",
                        style: TextStyle(
                          fontSize: EXERCISE_NAME_SIZE,
                          color: Donebutton,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Icon(
                        Icons.tune,
                        size: FLITER_ICON_SIZE,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: L_SIZEDBOX_SIZE,
                      ),
                      Icon(
                        Icons.folder,
                        size: FOLDER_ICON_SIZE,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "3 Exercise",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: M_SIZEDBOX_SIZE,
                      ),
                      Icon(
                        Icons.timer,
                        size: TIME_ICON_SIZE,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "60 Hours",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SubcategoryWorkouts(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
