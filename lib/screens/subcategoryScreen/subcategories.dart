import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/screens/contentScreen/contentScreen.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:anand_yogalaya/utils/firebase_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Obx(() => Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Backgroundcolor,
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
                            "${categoryModel.totalDuration!} minutes",
                            style: TextStyle(
                              fontSize: TOTALNO_EXERCISE_SIZE,
                              color: Donebutton.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: M_SIZEDBOX_SIZE,
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
                              } else if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No Contents to Display!\nTry Refreshing',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      color: kGreyShade1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                              return ListView.separated(
                                separatorBuilder: (c, i) {
                                  return const SizedBox(
                                    height: S_MEDIUM_PAD,
                                  );
                                },
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  Size size = MediaQuery.of(context).size;

                                  //print("------${snapshot.data?[index].likes?.contains(authController.user?.uid)}");
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        SMALL_PAD, 0, SMALL_PAD, 0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => ContentScreen(
                                            content: snapshot.data![index],
                                            index: index,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        //height: size.height * 0.12,
                                        decoration: BoxDecoration(
                                          color: SubcategoryboxColor,
                                          borderRadius:
                                              BorderRadius.circular(S_RADIUS),
                                          boxShadow: [
                                            BoxShadow(
                                                color: kblack.withOpacity(0.1),
                                                blurRadius: S_RADIUS,
                                                offset: const Offset(10, 15))
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              SMALL_PAD, 0, SMALL_PAD, 0),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            leading: Container(
                                              width: size.width * 0.17,
                                              height: size.height * 0.085,
                                              decoration: BoxDecoration(
                                                color: Backgroundcolor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  S_RADIUS,
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
                                                            TOP_WORKOUT_RAIDUS),
                                                    child: snapshot.data![index]
                                                        .imageWidget,
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
                                            trailing: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 8, 0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    SMALL_PAD),
                                                child: InkWell(
                                                  onTap: () {
                                                    contentController
                                                        .likeContent(snapshot
                                                            .data![index]);
                                                  },
                                                  child: Icon(
                                                      snapshot.data![index]
                                                              .likes!
                                                              .contains(
                                                                  authController
                                                                      .user
                                                                      ?.uid)
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border_outlined,
                                                      size: 24,
                                                      color: snapshot
                                                              .data![index]
                                                              .likes!
                                                              .contains(
                                                                  authController
                                                                      .user
                                                                      ?.uid)
                                                          ? Colors.red
                                                          : Colors.grey),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              snapshot.data![index].name,
                                              style: const TextStyle(
                                                fontWeight: WORKOUTS_WEIGHT,
                                                color: Colors.black,
                                                fontSize:
                                                    SUBCATEGORY_EXERCISE_NAME,
                                              ),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text(
                                                  snapshot.data![index].views
                                                          .toString() +
                                                      ' views',
                                                  style: TextStyle(
                                                      color: Donebutton
                                                          .withOpacity(0.7),
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.03,
                                                ),
                                                Icon(
                                                  Icons.access_time_outlined,
                                                  size: 10,
                                                  color: Donebutton.withOpacity(
                                                      0.7),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                Text(
                                                  (snapshot.data![index]
                                                              .duration!)
                                                          .toString() +
                                                      ' min',
                                                  style: TextStyle(
                                                      color: Donebutton
                                                          .withOpacity(0.7),
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
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
        ));
  }
}
