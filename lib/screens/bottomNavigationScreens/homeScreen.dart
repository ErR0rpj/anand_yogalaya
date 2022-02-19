import 'package:anand_yogalaya/screens/bottomNavigationScreens/searchScreen.dart';
import 'package:anand_yogalaya/screens/bottomNavigationScreens/trendingScreen.dart';
import 'package:anand_yogalaya/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/list_controllers.dart';
import '../../models/categories.dart';
import '../../utils/const.dart';
import '../search_screen.dart';
import '../subcategoryScreen/subcategories.dart';
import '../workoutdetailScreen/detailScreen.dart';


class HomepageScreen extends StatefulWidget{
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  HomepageScreenState createState() => HomepageScreenState();

}

class HomepageScreenState extends State<HomepageScreen> {
  List pages = [
    DashBoardScreen(),
    TrendingPageScreen(),
    Subcategory(),
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
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "trend", icon: Icon(Icons.trending_up_outlined)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: Colors.white,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_outlined),
          onPressed: () =>
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => buildSheet(),
              )
      ),
    );
  }

  Widget buildSheet() =>
      DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.7,
        builder: (_,controller) =>Container(
          decoration: BoxDecoration(
            color: SubcategoryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            )
          ),
          padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                buildText('Title'),
                TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey,width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.green,width: 2),
                        )
                      ),
                    ),
                buildText('Description'),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey,width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.green,width: 2),
                      )
                  ),
                ),
                buildText('Video URL'),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey,width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.green,width: 2),
                      )
                  ),
                ),
                buildText('Image URL'),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey,width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.green,width: 2),
                      )
                  ),
                ),
                buildText('Category'),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey,width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.green,width: 2),
                      )
                  ),
                ),
                SizedBox(height: 60,),
                DoneButton(context),
                    ],
                  ),
          ),
      );

  buildText(String text) => Container(
     margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: kblack
      ),
    ),
  );
}

Widget DoneButton(BuildContext context) {
  return Container(
    height: 55,
    width:  300,
    child: FlatButton(
      color: Donebutton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 3.0),
          Center(
            child: Text('Upload',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: DONE_BUTTON_SIZE,
                )),
          )
        ],
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomepageScreen()),
        ),
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    ),
  );
}



