import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategoryWorkout.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/const.dart';

class SubcategoryWorkouts extends StatelessWidget {
  final CategoryController _categoryController = Get.find();

  SubcategoryWorkouts({Key? key}) : super(key: key);

  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Exercises exercise = Exercises(
        videoUrl: 'assets/images/yoga_3.png',
        name: 'Meditation',
        time: 20,
        level: 'Beginner',
        description: '');
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
                  blurRadius: S_RADIUS,
                  offset: const Offset(10, 15))
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
                  child: const Icon(
                    Icons.play_arrow_outlined,
                    size: VIDEO_ICON_SIZE,
                    color: Donebutton,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              SizedBox(
                width: size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            exercise.level!,
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
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _categoryController.categories.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            }, //
          ))
        ],
      ),
    );
  }
}
