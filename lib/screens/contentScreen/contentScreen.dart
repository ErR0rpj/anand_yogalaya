import 'package:anand_yogalaya/models/contents.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentScreen extends StatefulWidget {
  final ContentModel content;
  const ContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
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
              height: size.height * 0.35,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: widget.content.photoUrl!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        children: [
                          const SizedBox(
                            width: L_SIZEDBOX_SIZE,
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
                            width: 150,
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
                            doneButton(context),
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

Widget doneButton(BuildContext context) {
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
