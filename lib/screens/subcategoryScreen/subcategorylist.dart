import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategoryData.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategoryWorkout.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';
import '../../utils/const.dart';

class SubcategoryWorkouts extends StatelessWidget {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Exercises exercise = exercises[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
      child: Container(
        height: size.height * 0.12,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(TOP_WORKOUT_RAIDUS),
            boxShadow: [
              BoxShadow(
                  color: kblack.withOpacity(0.1),
                  blurRadius: TOP_WORKOUT_BLUR_RADIUS,
                  offset: Offset(10, 15))
            ]),
        child: Padding(
          //  padding: const EdgeInsets.all(appPadding/2),
          padding: const EdgeInsets.only(
              left: appPadding / 2,
              top: appPadding / 3,
              bottom: appPadding / 3),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.02,
              ),
              Container(
                width: size.width * 0.17,
                height: size.height * 0.085,
                decoration: BoxDecoration(
                  color: PlayButtonColor,
                  borderRadius: BorderRadius.circular(PLAY_BUTTON_RADIUS),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                  child: Icon(
                    Icons.play_arrow_outlined,
                    size: VIDEO_ICON_SIZE,
                    color: Donebutton,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              Container(
                width: size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: TextStyle(
                          fontWeight: WORKOUTS_WEIGHT,
                          color: Colors.black,
                          fontSize: SUBCATEGORY_EXERCISE_NAME,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            exercise.totalexercises,
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: S_TOTALNO_EXERCISE_SIZE),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            exercise.level,
                            style: TextStyle(
                                color: Donebutton.withOpacity(0.7),
                                fontSize: 10),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Icon(
                            Icons.access_time_outlined,
                            size: 10,
                            color: Donebutton.withOpacity(0.7),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            exercise.time.toString() + ' min',
                            style: TextStyle(
                                color: Donebutton.withOpacity(0.7),
                                fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: playlistsList.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            },
          ))
        ],
      ),
    );
  }
}
