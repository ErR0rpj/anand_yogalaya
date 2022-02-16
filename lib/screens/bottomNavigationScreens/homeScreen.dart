import 'package:anand_yogalaya/screens/bottomNavigationScreens/searchScreen.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/const.dart';
import '../subcategoryScreen/subcategories.dart';
import '../uploadPostScreens/uploadpostForm.dart';
import '../workoutdetailScreen/detailScreen.dart';


class HomepageScreen extends StatefulWidget{
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();

}

class HomepageScreenState extends State<HomepageScreen> {
  List pages=[
   DashBoardScreen(),
   // HomeScreen(),
    TrendingPageScreen(),
    Subcategory(),
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
          BottomNavigationBarItem(label: "Home" ,icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "trend" ,icon: Icon(Icons.trending_up_outlined)),
          BottomNavigationBarItem(label: "Search" ,icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_outlined),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  Uploadpostform()),);
        },
      ),
    );

  }
}
