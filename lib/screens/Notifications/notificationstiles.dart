import 'package:flutter/material.dart';
import '../../utils/const.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/yoga_1.png"),
                  fit: BoxFit.cover))),
      title: Text(title, style: const TextStyle(color: kDarkColor)),
      subtitle: Text(subtitle, style: const TextStyle(color: kLightColor)),
      // onTap: onTap,
      enabled: enable,
    );
  }
}
