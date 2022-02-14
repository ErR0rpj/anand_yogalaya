import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../utils/const.dart';
import '../subcategoryScreen/subcategories.dart';
import '../trendingScreens/likedtrendingSection.dart';
import '../trendingScreens/newtrendingSection.dart';
import '../trendingScreens/popularSection.dart';
import '../workoutdetailScreen/detailScreen.dart';
import 'dart:math' as math;


class TrendingPageScreen extends StatefulWidget{
  const TrendingPageScreen({Key? key}) : super(key: key);

  @override
  TrendingPageScreenState createState() => TrendingPageScreenState();

}

class TrendingPageScreenState extends State<TrendingPageScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50,left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.sort_rounded,
                    size: HAMBURGER_ICON_SIZE,
                  ),
                ),
                const Text(
                  'Trending',
                  style: const TextStyle(
                      color: DASHBOARD_TEXT_COLOR, fontWeight: DASHBOARD_WEIGHT, fontSize: DASHBOARD_SIZE),
                ),
               SizedBox(width: 40,),
              ],
            ),
          ),
          SizedBox(height: L_SIZEDBOX_SIZE,),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: size.height*0.25,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20,top: 10),
                    width: size.width*0.76,
                    height: size.height*0.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Donebutton,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                      child:  Icon(Icons.play_arrow_outlined,size: VIDEO_ICON_SIZE,color: Colors.grey,),
                    ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30,left: 20),
            child: Row(
              children: [
                const Text(
                  'Browse by',
                  style: const TextStyle(
                      color: DASHBOARD_TEXT_COLOR, fontWeight: DASHBOARD_WEIGHT, fontSize: BROWSE_BY_SIZE),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(top: 5,left: 30,right: 40),
                controller: _tabController,
                 labelColor: Colors.black,
                 labelStyle: TextStyle(color: DASHBOARD_TEXT_COLOR, fontWeight: DASHBOARD_WEIGHT, fontSize: 17),
                 unselectedLabelColor: Colors.grey,
                 isScrollable: true,
                 indicatorSize: TabBarIndicatorSize.label,
                 tabs: [
                      Tab(text: "Popular",),
                      Tab(text: "New",),
                      Tab(text: "Liked",),
                   ],
              ),
            ),
          ),
          Container(
              height: size.height*0.38,
             width: size.width*0.9,
            child: TabBarView(
              controller: _tabController,
              children: [
                PopularListScreen(),
                NewListScreen(),
                LikedListScreen(),
              ],
            ),
          ),
        ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_outlined),
        onPressed: () {},
      ),
    );
  }
}