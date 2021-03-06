import 'package:anand_yogalaya/controllers/user_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/dashboard_screen.dart';
import 'package:anand_yogalaya/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/content_controller.dart';
import '../../utils/const.dart';
import '../trendingScreens/uploadform.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  UserController userController = Get.find();
  final ContentController contentController = Get.put(ContentController());
  final CategoryController categoryController = Get.put(CategoryController());

  List pages = [
    const DashBoardScreen(),
    const TrendingPageScreen(),
    const TrendingPageScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index) async {
    if (index < 2) {
      setState(() {
        currentIndex = index;
      });
    } else {
      CategoryModel? category =
          await showSearch(context: context, delegate: SearchScreen());
      print(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        selectedItemColor: Donebutton,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Trend", icon: Icon(Icons.trending_up_outlined)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: userController.user.isAdmin == true
          ? FloatingActionButton(
              backgroundColor: Donebutton,
              child: const Icon(Icons.upload_outlined),
              elevation: 5,
              onPressed: () {
                showUploadForm(context);
              },
            )
          : null,
    );
  }
}
