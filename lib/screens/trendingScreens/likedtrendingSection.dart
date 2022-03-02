import 'package:anand_yogalaya/controllers/content_controller.dart';
import 'package:anand_yogalaya/models/content_model.dart';
import 'package:anand_yogalaya/screens/contentScreen/contentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/const.dart';

class LikedListScreen extends StatelessWidget {
  final ContentController contentController = Get.find();

  LikedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ContentModel>>(
              future: contentController.fetchLikedContent(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Oops! Some Error Occurred!'));
                } else {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    itemCount: contentController.getLikedContentList.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 5,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => ContentScreen(
                              content:
                                  contentController.getLikedContentList[index],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: appPadding / 2,
                              top: appPadding / 2,
                              bottom: appPadding / 3),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.15,
                                height: size.height * 0.070,
                                decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: contentController
                                    .getLikedContentList[index].imageWidget,
                              ),
                              SizedBox(
                                width: size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: appPadding / 1,
                                      top: appPadding / 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contentController
                                            .getLikedContentList[index].name,
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            size: 14,
                                            color: Donebutton.withOpacity(0.7),
                                          ),
                                          SizedBox(width: size.width * 0.01),
                                          Text(
                                            contentController
                                                .getLikedContentList[index]
                                                .views
                                                .toString(),
                                            style: GoogleFonts.lato(
                                                color:
                                                    Donebutton.withOpacity(0.7),
                                                fontSize: 14),
                                          ),
                                          SizedBox(width: size.width * 0.03),
                                          Text(
                                            '|',
                                            style: GoogleFonts.lato(
                                                color:
                                                    Donebutton.withOpacity(0.7),
                                                fontSize: 14),
                                          ),
                                          SizedBox(width: size.width * 0.03),
                                          Icon(
                                            Icons.timer,
                                            size: 14,
                                            color: Donebutton.withOpacity(0.7),
                                          ),
                                          SizedBox(width: size.width * 0.01),
                                          Text(
                                            (contentController
                                                            .getLikedContentList[
                                                                index]
                                                            .duration! ~/
                                                        60)
                                                    .toString() +
                                                ' min',
                                            style: TextStyle(
                                              color:
                                                  Donebutton.withOpacity(0.7),
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
