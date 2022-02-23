import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/const.dart';
import '../bottomNavigationScreens/homeScreen.dart';


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
            SizedBox(height: VLARGE_SIZEDBOX_SIZE,),
            Container(
              height: 60,
              width:  UPLOAD_BUTTON_WIDTH,
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
                  Get.back()
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
         //   DoneButton(context),
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


