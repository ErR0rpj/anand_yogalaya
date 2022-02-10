import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.notifications_none_rounded,
              size: 30.0,
            ),
            Container(
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kDangerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
