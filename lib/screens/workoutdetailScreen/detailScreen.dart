import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/homeScreen.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../TopWorkoutScreens/topWorkout.dart';
import '../subcategoryScreen/subcategorylist.dart';

class WorkoutDetails extends StatefulWidget {
  const WorkoutDetails({Key? key}) : super(key: key);

  @override
  _WorkoutDetailsState createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
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
              padding: const EdgeInsets.only(
                  top: ARROW_BACK_TOP_PAD,
                  left: ARROW_BACK_LEFT_PAD,
                  right: ARROW_BACK_RIGHT_PAD),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
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
                  color: Colors.white,
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
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      width: L_SIZEDBOX_SIZE,
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
                  ]),
                  Container(
                    padding: const EdgeInsets.only(
                        top: DETAIL_TEXT_TOP_PAD,
                        left: DETAIL_TEXT_LEFT_PAD,
                        right: DETAIL_TEXT_RIGHT_PAD,
                        bottom: DETAIL_TEXT_BOTTOM_PAD),
                    child: Column(
                      children: [
                        Text(
                          'Keep in mind that you dont need to do the fullest expression of each of these poses—you are just starting to move your body and shake off the cobwebs. You can also use these stretches for your ​home practice, before doing a yoga video, or just to relieve tension at the end of the day.',
                          //   menu[widget.index].desc,
                          style: TextStyle(
                              fontSize: DETAIL_TEXT_SIZE,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 0.5,
                              wordSpacing: 1.5),
                          maxLines: 8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: DONE_BUTTON_TOP_PAD,
                        left: DONE_BUTTON_LEFT_PAD,
                        right: DONE_BUTTON_RIGHT_PAD),
                    child: Column(
                      children: <Widget>[
                        // const SizedBox(height: LARGE_SIZEDBOX_SIZE),
                        DoneButton(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: M_SIZEDBOX_SIZE,
                  )
                  // SubcategoryWorkouts(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

Widget DoneButton(BuildContext context) {
  return Container(
    height: 65,
    child: FlatButton(
      color: Donebutton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 3.0),
          Center(
            child: Text('Done',
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
