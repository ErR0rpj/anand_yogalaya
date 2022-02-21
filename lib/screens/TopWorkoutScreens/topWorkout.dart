import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkoutData.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../controllers/category_controller.dart';
import '../subcategoryScreen/subcategories.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  Widget _buildCourses(BuildContext context,int index) {
    Size size = MediaQuery.of(context).size;
    CategoryController categoryController = Get.find();

    return InkWell(
      onTap: (){
        Get.to(()=> Subcategory(
          index: index,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: Container(
          height: size.height * 0.25,
          decoration: BoxDecoration(
              color: kPrimaryPurple,
              borderRadius: BorderRadius.circular(TOP_WORKOUT_RAIDUS),
              boxShadow: [
                BoxShadow(
                    color: kblack.withOpacity(0.1),
                    blurRadius: TOP_WORKOUT_BLUR_RADIUS,
                    offset: const Offset(10, 15))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.48,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2, top: appPadding / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryController.playlists[index].name,
                          style: const TextStyle(
                            fontWeight: WORKOUTS_WEIGHT,
                            color: Colors.white,
                            fontSize: WORKOUTS_SIZE,
                          ),
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
                              '${categoryController.playlists[index].contents != null ? categoryController.playlists[index].contents?.length.toString() : '10 Exercises'}',
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
                              categoryController.playlists[index].totalDuration.toString() + ' min',
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
                SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: categoryController.playlists[index].imageUrl,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: appPadding,
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
        const SizedBox(height: 10),
        GetX<CategoryController>(
          init: Get.put<CategoryController>(CategoryController()),
          builder: (CategoryController categoryController) {
            if (categoryController != null && categoryController.playlists != null) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_,i){
                    return const SizedBox(
                      width: S_SIZEDBOX_SIZE,
                    );
                  },
                  itemCount: categoryController.playlists.length,
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
