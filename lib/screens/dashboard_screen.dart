import 'package:anand_yogalaya/screens/custom_app_bar.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selsctedIconIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(top: appPadding * 2),
        child: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
