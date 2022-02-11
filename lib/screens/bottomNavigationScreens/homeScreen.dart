import 'package:anand_yogalaya/screens/bottomNavigationScreens/searchScreen.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';

class HomepageScreen extends StatefulWidget{
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();

}

class HomepageScreenState extends State<HomepageScreen> {
  List pages=[
    DashBoardScreen(),
    TrendingPage(),
    SearchPage(),
  ];
  int currentIndex=0;
  void onTap(int index){
    setState((){
       currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        selectedItemColor: kPrimaryPurple,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home" ,icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "trend" ,icon: Icon(Icons.trending_up_outlined)),
          BottomNavigationBarItem(label: "Search" ,icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      extendBody: true,
    );
  }
}
