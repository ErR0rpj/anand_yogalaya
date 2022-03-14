import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/category_controller.dart';
import '../subcategoryScreen/subcategories.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    CategoryController categoryController = Get.find();

    return InkWell(
      onTap: () {
        Get.to(
          () => Subcategory(
            categoryModel: categoryController.getPlaylistList[index],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding / 2, vertical: appPadding / 2),
        child: Container(
          height: size.height * 0.25,
          decoration: BoxDecoration(
              color: kPrimaryPurple,
              borderRadius: BorderRadius.circular(TOP_WORKOUT_RAIDUS),
              boxShadow: [
                BoxShadow(
                    color: kblack.withOpacity(0.1),
                    blurRadius: S_RADIUS,
                    offset: const Offset(10, 15))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.45,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2,
                        top: appPadding / 1.5,
                        right: appPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryController.getPlaylistList[index].name,
                          style: const TextStyle(
                            fontWeight: WORKOUTS_WEIGHT,
                            color: Colors.white,
                            fontSize: WORKOUTS_SIZE,
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.folder_open_rounded,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              '${categoryController.getPlaylistList[index].contents != null ? categoryController.getPlaylistList[index].contents?.length.toString() : '10 Exercises'}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              categoryController
                                      .getPlaylistList[index].totalDuration
                                      .toString() +
                                  ' min',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width * 0.35,
                    height: size.height * 0.2,
                    child: categoryController.getPlaylistList[index].imageWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: S_MEDIUM_PAD,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Top Yoga Workout',
                style: TextStyle(
                  fontSize: TOP_WORKOUT_SIZE,
                  fontWeight: TOPWORKOUT_TITLE__WEIGHT,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GetX<CategoryController>(
          init: Get.put<CategoryController>(CategoryController()),
          builder: (CategoryController categoryController) {
            if (categoryController != null &&
                categoryController.getPlaylistList != null) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, i) {
                    return const SizedBox(
                      width: S_SIZEDBOX_SIZE,
                    );
                  },
                  itemCount: categoryController.getPlaylistList.length,
                  itemBuilder: (context, index) {
                    return _buildCourses(context, index);
                  },
                ),
              );
            } else {
              return Text("loading...");
            }
          },
        ),
      ],
    );
  }
}
