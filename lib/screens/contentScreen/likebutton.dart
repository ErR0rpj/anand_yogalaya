import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({Key? key}) : super(key: key);

  @override
  _LikeButtonnWidgetState createState() => _LikeButtonnWidgetState();
}

class _LikeButtonnWidgetState extends State<LikeButtonWidget> {
  bool isLiked = false;
  int likeCount = 10;

  @override
  Widget build(BuildContext context) {
    final double size = 40;

    return LikeButton(
      size: size,
      isLiked: isLiked,
      likeCount: likeCount,
      likeBuilder: (isLiked) {
        final color = isLiked ? Colors.red : Colors.grey;
        return Icon(
          Icons.favorite_rounded,
          color: color,
          size: size,
        );
      },
      likeCountPadding: const EdgeInsets.only(left: 12),
      countBuilder: (count, isLiked, text) {
        final color = isLiked ? Colors.black : Colors.grey;
        return Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      onTap: (isLiked) async {
        this.isLiked = !isLiked;
        likeCount += this.isLiked ? 1 : -1;
        return !isLiked;
      },
    );
  }
}
