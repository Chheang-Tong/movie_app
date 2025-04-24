import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/color_resouce.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double? starSize;
  final double? maxrate;
  final Function(double) onChanged;
  const Rating({
    super.key,
    required this.rating,
    this.starSize,
    this.maxrate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedRatingStars(
      initialRating: rating,
      minRating: 0.0,
      maxRating: maxrate ?? 5.0,
      filledColor: ColorResources.blueColor,
      emptyColor: Colors.grey,
      filledIcon: Icons.star,
      halfFilledIcon: Icons.star_half,
      emptyIcon: Icons.star_border,
      onChanged: onChanged,
      displayRatingValue: true,
      interactiveTooltips: true,
      customFilledIcon: Icons.star,
      customHalfFilledIcon: Icons.star_half,
      customEmptyIcon: Icons.star_border,
      starSize: starSize ?? 20,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      readOnly: false,
    );
  }
}
