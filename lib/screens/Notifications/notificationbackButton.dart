import 'package:flutter/material.dart';
import '../../utils/const.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: BACK_BUTTON_ICON_SIZE,
        color: Donebutton,
      ),
    //  icon: Icon(Icons.arrow_back_ios, color: Donebutton),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
