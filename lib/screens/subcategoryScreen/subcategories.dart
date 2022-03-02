import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/screens/contentScreen/contentScreen.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/content_model.dart';

class Subcategory extends StatelessWidget {
  final CategoryModel categoryModel;
  Subcategory({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryController categoryController = Get.find();
  final ContentController contentController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Donebutton,
        ),
        child: Column(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.only(
                  top: ARROW_BACK_TOP_PAD,
                  left: ARROW_BACK_LEFT_PAD,
                  right: ARROW_BACK_RIGHT_PAD,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
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
              child: categoryModel.imageWidget,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: SubcategoryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: L_SIZEDBOX_SIZE,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: L_SIZEDBOX_SIZE,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          categoryModel.name,
                          style: const TextStyle(
                            fontSize: EXERCISE_NAME_SIZE,
                            color: Donebutton,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Expanded(
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
                      const SizedBox(
                        width: L_SIZEDBOX_SIZE,
                      ),
                      const Icon(
                        Icons.folder,
                        size: FOLDER_ICON_SIZE,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: VS_SIZEDBOX_SIZE,
                      ),
                      Text(
                        "${categoryModel.contents?.length} Exercise",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: S_SIZEDBOX_SIZE,
                      ),
                      const Icon(
                        Icons.timer,
                        size: TIME_ICON_SIZE,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: VS_SIZEDBOX_SIZE,
                      ),
                      Text(
                        "${Duration(seconds: categoryModel.totalDuration!).inMinutes} minutes",
                        style: TextStyle(
                          fontSize: TOTALNO_EXERCISE_SIZE,
                          color: Donebutton.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder<List<ContentModel>>(
                      future: contentController
                          .fetchContentForCategory(categoryModel.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Oops! Some Error Occurred!'));
                        } else {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Size size = MediaQuery.of(context).size;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: appPadding,
                                    vertical: appPadding / 2),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => ContentScreen(
                                        content: snapshot.data![index],
                                      ),
                                    );
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
                                            blurRadius: S_RADIUS,
                                            offset: const Offset(10, 15))
                                      ],
                                    ),
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
                                          Container(
                                            width: size.width * 0.17,
                                            height: size.height * 0.085,
                                            decoration: BoxDecoration(
                                              color: PlayButtonColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                PLAY_BUTTON_RADIUS,
                                              ),
                                            ),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          TOP_WORKOUT_IMAGE_RADIUS),
                                                  child: snapshot
                                                      .data![index].imageWidget,
                                                ),
                                                const Center(
                                                  child: Icon(
                                                    Icons.play_arrow_outlined,
                                                    size: VIDEO_ICON_SIZE,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          SizedBox(
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
                                                    snapshot.data![index].name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          WORKOUTS_WEIGHT,
                                                      color: Colors.black,
                                                      fontSize:
                                                          SUBCATEGORY_EXERCISE_NAME,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                                .views
                                                                .toString() +
                                                            ' views',
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
                                                        snapshot.data![index]
                                                                .duration
                                                                .toString() +
                                                            ' min',
                                                        style: TextStyle(
                                                            color: Donebutton
                                                                .withOpacity(
                                                                    0.7),
                                                            fontSize: 10),
                                                      ),
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
                            },
                          );
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
