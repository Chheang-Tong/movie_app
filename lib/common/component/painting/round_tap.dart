import 'package:flutter/material.dart';

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator({
    required Color color,
    required double weight,
    required double width,
    double radius = 8.0,
  }) : _painter = _RoundedRectanglePainter(color, weight, width, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RoundedRectanglePainter extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;
  final double radius;

  _RoundedRectanglePainter(Color color, this.weight, this.width, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    // final Offset customOffset =
    //     offset + Offset(0, config.size!.height - weight);
    final Offset customOffset1 = offset +
        Offset((config.size!.width - width) / 2, config.size!.height - weight);
    final Rect rect = customOffset1 & Size(width, weight);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    // final RRect mrRect = RRect.fromRectXY(rect, weight, weight);
    canvas.drawRRect(rRect, _paint);
  }
}
