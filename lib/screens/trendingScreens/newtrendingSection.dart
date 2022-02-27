import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/content_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';

class NewListScreen extends StatelessWidget {
  final ContentController contentController = Get.find();

  NewListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ContentModel>>(
              future: contentController.fetchNewContent(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Oops! Some Error Occurred!'));
                } else {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: contentController.getNewContentList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: appPadding / 2,
                              top: appPadding / 3,
                              bottom: appPadding / 3),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              SizedBox(
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: appPadding / 2,
                                      top: appPadding / 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contentController
                                            .getNewContentList[index].name,
                                        style: const TextStyle(
                                          fontWeight: WORKOUTS_WEIGHT,
                                          color: Colors.black,
                                          fontSize: SUBCATEGORY_EXERCISE_NAME,
                                        ),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            size: 14,
                                            color: Donebutton.withOpacity(0.7),
                                          ),
                                          Text(
                                            contentController
                                                .getNewContentList[index].views
                                                .toString(),
                                            style: TextStyle(
                                                color:
                                                    Donebutton.withOpacity(0.7),
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.03,
                                          ),
                                          Icon(
                                            Icons.timer,
                                            size: 14,
                                            color: Donebutton.withOpacity(0.7),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Text(
                                            contentController
                                                .getNewContentList[index]
                                                .duration
                                                .toString(),
                                            style: TextStyle(
                                                color:
                                                    Donebutton.withOpacity(0.7),
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                width: size.width * 0.17,
                                height: size.height * 0.085,
                                decoration: BoxDecoration(
                                  color: PlayButtonColor,
                                  borderRadius:
                                      BorderRadius.circular(PLAY_BUTTON_RADIUS),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      TOP_WORKOUT_IMAGE_RADIUS),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
