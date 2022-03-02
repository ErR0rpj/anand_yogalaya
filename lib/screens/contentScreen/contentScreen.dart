import 'package:anand_yogalaya/models/content_model.dart';
import 'package:anand_yogalaya/screens/contentScreen/likebutton.dart';
import 'package:anand_yogalaya/services/youtube_player_configured/youtube_player_flutter.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class ContentScreen extends StatefulWidget {
  final ContentModel content;
  const ContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  YoutubePlayerController? _youtubePlayerController;

  bool isContent = false;

  @override
  void initState() {
    super.initState();
    if (widget.content.videoUrl == null || widget.content.videoUrl!.isEmpty) {
      isContent = true;
    } else {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.content.videoUrl!)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (_youtubePlayerController != null) {
      _youtubePlayerController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Donebutton,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: ARROW_BACK_TOP_PAD,
                left: ARROW_BACK_LEFT_PAD,
                right: ARROW_BACK_RIGHT_PAD,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: BACK_BUTTON_ICON_SIZE,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: isContent
                  ? widget.content.imageWidget
                  : YoutubePlayer(
                      width: MediaQuery.of(context).size.width / 1,
                      controller: _youtubePlayerController!,
                      showVideoProgressIndicator: true,
                    ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: L_SIZEDBOX_SIZE,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            widget.content.name,
                            style: const TextStyle(
                              fontSize: EXERCISE_NAME_SIZE,
                              color: Donebutton,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          //   LikeButtonWidget(),                in this like button count of like is also visible
                          LikeButton(
                            size: 40,
                          ), // in this only like button with no count of likes
                          const SizedBox(
                            width: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: L_SIZEDBOX_SIZE,
                          ),
                          const Icon(
                            Icons.timer,
                            size: TIME_ICON_SIZE,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${Duration(seconds: (widget.content.duration)!).inMinutes} min",
                            style: TextStyle(
                              fontSize: TOTALNO_EXERCISE_SIZE,
                              color: Donebutton.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: DETAIL_TEXT_TOP_PAD,
                            left: DETAIL_TEXT_LEFT_PAD,
                            right: DETAIL_TEXT_RIGHT_PAD,
                            bottom: DETAIL_TEXT_BOTTOM_PAD),
                        child: Column(
                          children: [
                            Text(
                              (widget.content.description).toString(),
                              style: const TextStyle(
                                  fontSize: DETAIL_TEXT_SIZE,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 0.5,
                                  wordSpacing: 1.5),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: DONE_BUTTON_TOP_PAD,
                            left: DONE_BUTTON_LEFT_PAD,
                            right: DONE_BUTTON_RIGHT_PAD),
                        child: Column(
                          children: <Widget>[
                            doneButton(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: M_SIZEDBOX_SIZE,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget doneButton() {
  return SizedBox(
    height: 65,
    child: FlatButton(
      color: Donebutton,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 3.0),
          Center(
            child: Text('Done',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: DONE_BUTTON_SIZE,
                )),
          )
        ],
      ),
      onPressed: () {
        Get.back();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    ),
  );
}
