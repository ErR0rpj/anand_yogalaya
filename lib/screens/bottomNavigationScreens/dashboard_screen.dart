import 'package:anand_yogalaya/screens/TopWorkoutScreens/topWorkout.dart';
import 'package:anand_yogalaya/screens/categoryScreens/all_categories_screen.dart';
import 'package:anand_yogalaya/screens/sidebarMenu/sidebar_widget.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/category_controller.dart';
import '../categoryScreens/category_card.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavsideBar(),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.sort_rounded,
                color: kblack,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Dashboard",
          style: GoogleFonts.raleway(
            color: kblack,
            fontWeight: DASHBOARD_WEIGHT,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CategoryTab(),
              SizedBox(
                height: VL_CONTAINER_SIZE,
                child: GetX<CategoryController>(
                  init: Get.put<CategoryController>(CategoryController()),
                  builder: (CategoryController categoryController) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: ListView.separated(
                        separatorBuilder: (_, i) {
                          return const SizedBox(
                            width: S_SIZEDBOX_SIZE,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.getCategoryList.length,
                        itemBuilder: (_, index) {
                          return CategoryCard(
                              categoryController.getCategoryList[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: L_SIZEDBOX_SIZE),
              const Workouts(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: S_MEDIUM_PAD,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: CATEGORY_SIZE,
                    fontWeight: CATEGORIES_TITLE__WEIGHT,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllCategoriesScreen()),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                      fontSize: SEE_ALL_SIZE,
                      fontWeight: SEEALL_WEIGHT,
                      color: SEE_ALL_COLOR),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
