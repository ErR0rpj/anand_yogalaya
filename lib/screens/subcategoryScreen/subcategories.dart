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
            height: size.height,
            decoration: const BoxDecoration(
              color: Donebutton,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                  Container(
                    height: size.height * 0.3,
                    alignment: Alignment.center,
                    child: categoryModel.imageWidget,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 30, right: 25, top: 25, bottom: 20),
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryModel.name,
                          style: GoogleFonts.lato(
                            fontSize: EXERCISE_NAME_SIZE,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: S_SIZEDBOX_SIZE),
                        Row(
                          children: [
                            const Icon(
                              Icons.folder_rounded,
                              size: FOLDER_ICON_SIZE,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: VS_SIZEDBOX_SIZE,
                            ),
                            Text(
                              "${categoryModel.contents?.length} Exercise",
                              style: GoogleFonts.lato(
                                fontSize: TOTALNO_EXERCISE_SIZE,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: S_SIZEDBOX_SIZE,
                            ),
                            const Icon(
                              Icons.timer,
                              size: TIME_ICON_SIZE,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: VS_SIZEDBOX_SIZE,
                            ),
                            Text(
                              "${categoryModel.totalDuration!} minutes",
                              style: GoogleFonts.lato(
                                fontSize: TOTALNO_EXERCISE_SIZE,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: M_SIZEDBOX_SIZE,
                        ),
                        FutureBuilder<List<ContentModel>>(
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
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (c, i) {
                                  return const SizedBox(
                                    height: MEDIUM_PAD,
                                  );
                                },
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  Size size = MediaQuery.of(context).size;

                                  //print("------${snapshot.data?[index].likes?.contains(authController.user?.uid)}");
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => ContentScreen(
                                          content: snapshot.data![index],
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF2EC),
                                        borderRadius:
                                            BorderRadius.circular(M_RADIUS),
                                        boxShadow: [
                                          BoxShadow(
                                            color: kblack.withOpacity(0.3),
                                            blurRadius: S_RADIUS,
                                            offset: const Offset(1, 4),
                                          )
                                        ],
                                      ),
                                      child: ListTile(
                                        contentPadding: const EdgeInsets.all(8),
                                        leading: Container(
                                          width: 65,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            color: Donebutton,
                                            borderRadius:
                                                BorderRadius.circular(S_RADIUS),
                                          ),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              snapshot.data![index].imageWidget,
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
                                          padding: const EdgeInsets.only(
                                            right: SMALL_PAD,
                                            top: MEDIUM_PAD + MEDIUM_PAD,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              contentController.likeContent(
                                                  snapshot.data![index]);
                                            },
                                            child: Icon(
                                              snapshot.data![index].likes!
                                                      .contains(authController
                                                          .user?.uid)
                                                  ? Icons.star_rounded
                                                  : Icons.star_outline_rounded,
                                              size: 24,
                                              color: Colors.indigo,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          snapshot.data![index].name,
                                          style: GoogleFonts.lato(
                                            fontWeight: WORKOUTS_WEIGHT,
                                            color: Colors.black,
                                            fontSize: SUBCATEGORY_EXERCISE_NAME,
                                          ),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Text(
                                              snapshot.data![index].views
                                                      .toString() +
                                                  ' views',
                                              style: GoogleFonts.lato(
                                                  color: Donebutton.withOpacity(
                                                      0.7),
                                                  fontSize: 14),
                                            ),
                                            SizedBox(width: size.width * 0.03),
                                            Icon(
                                              Icons.access_time_outlined,
                                              size: 14,
                                              color:
                                                  Donebutton.withOpacity(0.7),
                                            ),
                                            SizedBox(width: size.width * 0.01),
                                            Text(
                                              (snapshot.data![index].duration!)
                                                      .toString() +
                                                  ' min',
                                              style: GoogleFonts.lato(
                                                  color: Donebutton.withOpacity(
                                                      0.7),
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: kWhiteColor,
                    height: size.height * 0.45,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
