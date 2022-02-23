import 'package:flutter/material.dart';
import '../../utils/const.dart';
import 'notificationAppbar.dart';
import 'notificationbackButton.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: DefaultAppBar(
        title: 'Notification',
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(kFixPadding),
          padding: EdgeInsets.all(kFixPadding),
          decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: kLightColor, blurRadius: 2.0)]),
          child: Column(
            children: [
              Text(
                  'Exercises to do today for six packs',
                  style: kDarkTextStyle),
              SizedBox(height: 16.0),
              Image(image: AssetImage("assets/images/yoga_1.png")),
              SizedBox(height: 16.0),
              Text(
                  "Keep in mind that you dont need to do the fullest expression of each of these poses—you are just starting to move your body and shake off the cobwebs. You can also use these stretches for your ​home practice, before doing a yoga video, or just to relieve tension at the end of the day.",
                  style: TextStyle(color: kLightColor)),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text('15/Feb/2022 06:45 PM',
                    style: TextStyle(color: kLightColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
