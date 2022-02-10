import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  size: 40.0,
                ),
              ),
              SizedBox(
                width: size.width * 0.18,
              ),
              const Text(
                'Dashboard',
                style: const TextStyle(
                    color: kblack, fontWeight: FontWeight.w600, fontSize: 28),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '0',
                        style: TextStyle(color: kwhite, fontSize: 8),
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
