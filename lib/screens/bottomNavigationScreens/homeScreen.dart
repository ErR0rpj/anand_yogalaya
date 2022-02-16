// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:anand_yogalaya/controllers/list_controllers.dart';
import 'package:anand_yogalaya/models/categories.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/dashboard_screen.dart';
import 'package:anand_yogalaya/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/const.dart';
import '../subcategoryScreen/subcategories.dart';
import '../uploadPostScreens/uploadpostForm.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  List pages = [
    const DashBoardScreen(),
    const TrendingPageScreen(),
    const Subcategory(),
  ];
  int currentIndex = 0;
  void onTap(int index) async {
    if (index < 2) {
      setState(() {
        currentIndex = index;
      });
    } else {
      Categories? category =
          await showSearch(context: context, delegate: SearchScreen());
      print(category);
    }
  }

  ListController listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        selectedItemColor: kPrimaryPurple,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: "Trend", icon: Icon(Icons.trending_up_outlined)),
          const BottomNavigationBarItem(
              label: "Search", icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Uploadpostform()),
          );
        },
      ),
    );
  }
}
