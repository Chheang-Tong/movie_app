
import 'package:flutter/material.dart';

import '../../common.dart';

class Star extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color1;
  final Color color2;
  const Star({
    super.key,
    required this.icon,
    required this.size,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon,
          color: color1,
          size: size,
        ),
        ClipRect(
          clipper: PartialClipper(0.6),
          child: Icon(
            icon,
            color: color2,
            size: size,
          ),
        ),
      ],
    );
  }
}


