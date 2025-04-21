import 'package:flutter/material.dart';

class PartialClipper extends CustomClipper<Rect> {
  final double percent;

  PartialClipper(this.percent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percent, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
