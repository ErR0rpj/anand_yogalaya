import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Transform(
                transform: Matrix4.rotationY(math.pi),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.sort_rounded,
                  size: HAMBURGER_ICON_SIZE,
                ),
              ),
              SizedBox(
                width: 90,
              ),
              Text(
                'Dashboard',
                style: GoogleFonts.lato(
                  color: DASHBOARD_TEXT_COLOR,
                  fontWeight: DASHBOARD_WEIGHT,
                  fontSize: DASHBOARD_SIZE,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: NOTIFICATION_ICON_SIZE,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius:
                            BorderRadius.circular(NOTIFICATION_COUNT_RADIUS)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '0',
                        style: TextStyle(
                            color: NOTIFICATION_COUNT_NUMBERS_COLOR,
                            fontSize: NOTIFICATION_COUNT_NUMBERS),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
