import 'package:flutter/material.dart';

import '../../utils/const.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key? key, required this.title, required this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Donebutton,fontSize: 30)),
      centerTitle: true,
      backgroundColor: kwhite,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Donebutton,size: 30),
      leading: child,
      actions: action,
    );
  }
}