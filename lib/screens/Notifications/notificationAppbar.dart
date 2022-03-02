import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/const.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final List<Widget>? action;
  const DefaultAppBar({
    Key? key,
    required this.title,
    required this.child,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.raleway(
          color: Donebutton,
          fontWeight: DASHBOARD_WEIGHT,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
      backgroundColor: kwhite,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Donebutton, size: 30),
      leading: child,
      actions: action,
    );
  }
}
