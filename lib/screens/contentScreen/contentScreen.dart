import 'package:anand_yogalaya/models/content_model.dart';
import 'package:anand_yogalaya/screens/trendingScreens/uploadform.dart';
import 'package:anand_yogalaya/services/youtube_player_configured/youtube_player_flutter.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/content_controller.dart';

class ContentScreen extends StatefulWidget {
  final ContentModel content;
  final int? index;
  const ContentScreen({Key? key, required this.content, this.index})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  YoutubePlayerController? _youtubePlayerController;
  final ContentController contentController = Get.find();
  bool isContent = false;

  @override
  void initState() {
    super.initState();
    if (widget.content.videoUrl == null || widget.content.videoUrl!.isEmpty) {
      isContent = true;
    } else {
      try {
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId:
              YoutubePlayer.convertUrlToId(widget.content.videoUrl!)!,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            enableCaption: true,
          ),
        );
      } catch (e) {
        print('Error in YouTube video: $e');
      }
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),
                        InkWell(
                          onTap: () async {
                            await showUpdateForm(context, widget.content);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.edit_rounded,
                            size: BACK_BUTTON_ICON_SIZE,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                  padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: L_SIZEDBOX_SIZE,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.content.name,
                            style: const TextStyle(
                              fontSize: EXERCISE_NAME_SIZE,
                              color: Donebutton,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
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
                      const SizedBox(
                        height: S_MEDIUM_PAD,
                      ),
                      Column(
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
                      const SizedBox(
                        height: M_SIZEDBOX_SIZE,
                      ),
                      buttonWithText(
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        height: M_SIZEDBOX_SIZE,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
