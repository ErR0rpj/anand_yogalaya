import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/screens/subcategoryScreen/subcategoryWorkout.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/contents.dart';
import '../../services/database.dart';
import '../TopWorkoutScreens/topWorkout.dart';
import '../workoutdetailScreen/detailScreen.dart';
import 'subcategorylist.dart';

class Subcategory extends StatefulWidget {
  int? index;
  Subcategory(
      {Key? key,
      required this.index,
      })
      : super(key: key);

  @override
  _SubcategoryState createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {

  CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Donebutton,
        ),
        child: Column(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(
                    top: ARROW_BACK_TOP_PAD,
                    left: ARROW_BACK_LEFT_PAD,
                    right: ARROW_BACK_RIGHT_PAD),
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height * 0.35,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: BACK_BUTTON_ICON_SIZE,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.35,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: categoryController.playlists[widget.index!].imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                      Expanded(
                        flex: 2,
                        child: Text(
                          categoryController.playlists[widget.index!].name,
                          style: TextStyle(
                            fontSize: EXERCISE_NAME_SIZE,
                            color: Donebutton,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.tune,
                          size: FLITER_ICON_SIZE,
                          color: Colors.grey,
                        ),
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
                        width: VS_SIZEDBOX_SIZE,
                      ),
                      Text(
                        "${categoryController.playlists[widget.index!].contents?.length} Exercise",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: S_SIZEDBOX_SIZE,
                      ),
                      Icon(
                        Icons.timer,
                        size: TIME_ICON_SIZE,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: VS_SIZEDBOX_SIZE,
                      ),
                      Text(
                        "${Duration(seconds: categoryController.playlists[widget.index!].totalDuration!).inMinutes} minutes",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //SubcategoryWorkouts(),

                  Expanded(
                    child: FutureBuilder<List<ContentModel>>(
                      future: Database().generateContentList(categoryController.playlists[widget.index!].id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Oops! Some Error Occurred!'));
                        } else {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Size size = MediaQuery.of(context).size;

                                Exercises exercise = Exercises(
                                    videoUrl: snapshot.data?[index].videoUrl,
                                    name: snapshot.data?[index].name,
                                    time: snapshot.data?[index].duration,
                                    description: snapshot.data?[index].description,
                                    level: 'Beginner');

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: appPadding,
                                      vertical: appPadding / 2),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=>WorkoutDetails(
                                        exercise: exercise,
                                      ));
                                    },
                                    child: Container(
                                      height: size.height * 0.12,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              TOP_WORKOUT_RAIDUS),
                                          boxShadow: [
                                            BoxShadow(
                                                color: kblack.withOpacity(0.1),
                                                blurRadius:
                                                    TOP_WORKOUT_BLUR_RADIUS,
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        PLAY_BUTTON_RADIUS),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        TOP_WORKOUT_IMAGE_RADIUS),
                                                child: Stack(
                                                  children: [
                                                    CachedNetworkImage(
                                                      fit: BoxFit.fitHeight,
                                                      imageUrl: exercise.videoUrl!,
                                                      placeholder: (context, url) =>
                                                          Center(child: CircularProgressIndicator()),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                    Center(
                                                      child: Icon(
                                                        Icons.play_arrow_outlined,
                                                        size: VIDEO_ICON_SIZE,
                                                        color: Donebutton,
                                                      ),
                                                    ),

                                                  ],
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
                                                    left: appPadding / 2,
                                                    top: appPadding / 4),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      exercise.name!,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            WORKOUTS_WEIGHT,
                                                        color: Colors.black,
                                                        fontSize:
                                                            SUBCATEGORY_EXERCISE_NAME,
                                                      ),
                                                      maxLines: 1,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          exercise.level!,
                                                          style: TextStyle(
                                                              color: Donebutton
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontSize: 10),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .access_time_outlined,
                                                          size: 10,
                                                          color: Donebutton
                                                              .withOpacity(0.7),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.01,
                                                        ),
                                                        Text(
                                                          exercise.time
                                                                  .toString() +
                                                              ' min',
                                                          style: TextStyle(
                                                              color: Donebutton
                                                                  .withOpacity(
                                                                      0.7),
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
                                  ),
                                );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
