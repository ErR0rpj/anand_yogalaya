
import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/screens/TopWorkoutScreens/workout.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Workout workout = workouts[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
      child: Container(
        height: size.height * 0.25,
        decoration: BoxDecoration(
            color: workout.color,
            borderRadius: BorderRadius.circular(TOP_WORKOUT_RAIDUS),
            boxShadow: [
              BoxShadow(
                  color: kblack.withOpacity(0.1),
                  blurRadius: TOP_WORKOUT_BLUR_RADIUS,
                  offset: Offset(10, 15))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Container(
                width: size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 1.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.name,
                        style: TextStyle(
                          fontWeight: WORKOUTS_WEIGHT,
                          color: Colors.white,
                          fontSize: WORKOUTS_SIZE,
                        ),
                      //  maxLines: 1,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(Icons.folder_open_rounded,color: Colors.white.withOpacity(0.7),),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(workout.exercises,style: TextStyle(color: Colors.white.withOpacity(0.7),),)
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,color: Colors.white.withOpacity(0.7),),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(workout.time.toString() + ' min',style: TextStyle(color: Colors.white.withOpacity(0.7),),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width * 0.3,
                height: size.height * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                  child: Image(
                    image: AssetImage(workout.imageUrl),
                    fit: BoxFit.cover,
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Yoga Workout',
                  style: TextStyle(
                    fontSize: TOP_WORKOUT_SIZE,
                    fontWeight: TOPWORKOUT_TITLE__WEIGHT,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: SEEALL_WEIGHT,
                      color: SEE_ALL_COLOR),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  return _buildCourses(context, index);
                },
              ))
        ],
      ),
    );
  }
}
