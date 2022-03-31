import 'package:anand_yogalaya/screens/Notifications/notificationbackButton.dart';
import '../../utils/const.dart';
import 'package:flutter/material.dart';
import 'notificationAppbar.dart';
import 'notificationstiles.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: const DefaultAppBar(
        title: 'Notifications',
        child: DefaultBackButton(),
      ),
      body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
                title: 'Anand Yogalaya',
                subtitle: 'Today we are going to learn about yoga',
                enable: true,
                onTap: () {});
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    );
  }
}
