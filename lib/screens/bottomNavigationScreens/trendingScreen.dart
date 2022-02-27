import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/services/youtube_player_configured/youtube_player_flutter.dart';
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
              height: size.height * 0.28,
              color: kWhiteColor,
              child: ListView.builder(
                itemCount: contentController.getContentList.length > 5
                    ? 5
                    : contentController.getContentList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Donebutton,
                    ),
                    child: contentController.getContentList[index].videoUrl !=
                            null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              YoutubePlayer.getThumbnail(
                                videoId: YoutubePlayer.convertUrlToId(
                                    contentController
                                        .getContentList[index].videoUrl!)!,
                              ),
                              height: 150,
                              width: 300,
                              loadingBuilder: (_, child, progress) =>
                                  progress == null
                                      ? child
                                      : Container(
                                          color: Colors.white,
                                          width: 60,
                                          height: 45,
                                        ),
                              errorBuilder: (context, _, __) => ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    TOP_WORKOUT_IMAGE_RADIUS),
                                child: const Icon(
                                  Icons.play_arrow_outlined,
                                  size: VIDEO_ICON_SIZE,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius:
                                BorderRadius.circular(TOP_WORKOUT_IMAGE_RADIUS),
                            child: const Icon(
                              Icons.play_arrow_outlined,
                              size: VIDEO_ICON_SIZE,
                              color: Colors.grey,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: const [
                  Text(
                    'Browse by',
                    style: TextStyle(
                        color: DASHBOARD_TEXT_COLOR,
                        fontWeight: DASHBOARD_WEIGHT,
                        fontSize: BROWSE_BY_SIZE),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding:
                    const EdgeInsets.only(top: 5, left: 30, right: 40),
                controller: _tabController,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                    color: DASHBOARD_TEXT_COLOR,
                    fontWeight: DASHBOARD_WEIGHT,
                    fontSize: 17),
                unselectedLabelColor: Colors.grey,
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
            SizedBox(
              height: size.height * 0.38,
              width: size.width * 0.9,
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
