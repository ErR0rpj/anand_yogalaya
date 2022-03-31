import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/services/youtube_player_configured/youtube_player_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/const.dart';
import '../sidebarMenu/sidebar_widget.dart';
import '../trendingScreens/likedtrendingSection.dart';
import '../trendingScreens/newtrendingSection.dart';
import '../trendingScreens/popularSection.dart';

class TrendingPageScreen extends StatefulWidget {
  const TrendingPageScreen({Key? key}) : super(key: key);

  @override
  TrendingPageScreenState createState() => TrendingPageScreenState();
}

class TrendingPageScreenState extends State<TrendingPageScreen>
    with TickerProviderStateMixin {
  ContentController contentController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 3, vsync: this);
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
          "Trending",
          style: GoogleFonts.raleway(
            color: kblack,
            fontWeight: DASHBOARD_WEIGHT,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 210,
              color: kWhiteColor,
              child: CarouselSlider.builder(
                itemCount: contentController.getContentList.length > 5
                    ? 5
                    : contentController.getContentList.length,
                itemBuilder: (content, index, heroIndex) {
                  return SizedBox(
                    width: size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                          decoration: BoxDecoration(
                            color:
                                contentController.getContentList[index].color,
                          ),
                          child: contentController
                              .getContentList[index].imageWidget),
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Text(
                    'Browse by',
                    style: GoogleFonts.lato(
                        color: DASHBOARD_TEXT_COLOR,
                        fontWeight: DASHBOARD_WEIGHT,
                        fontSize: BROWSE_BY_SIZE),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding:
                      const EdgeInsets.only(top: 5, left: 25, right: 25),
                  controller: _tabController,
                  labelColor: Colors.black,
                  labelStyle: GoogleFonts.lato(
                    color: DASHBOARD_TEXT_COLOR,
                    fontWeight: DASHBOARD_WEIGHT,
                    fontSize: 15,
                  ),
                  indicator: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Donebutton, width: 3.0),
                    ),
                  ),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: GoogleFonts.lato(
                    fontWeight: DASHBOARD_WEIGHT,
                  ),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      text: "Popular",
                    ),
                    Tab(
                      text: "New",
                    ),
                    Tab(
                      text: "Liked",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.9,
              width: size.width - 35,
              child: TabBarView(
                controller: _tabController,
                children: [
                  PopularListScreen(),
                  NewListScreen(),
                  LikedListScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
