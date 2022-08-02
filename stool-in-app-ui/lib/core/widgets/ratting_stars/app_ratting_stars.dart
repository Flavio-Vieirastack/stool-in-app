import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class AppRattingStars extends StatelessWidget {
  final double value;
  final double size;
  final dynamic Function(double)? onValueChanged;
  const AppRattingStars({
    Key? key,
    required this.value,
    required this.onValueChanged,
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: onValueChanged,
      starCount: 5,
      starSize: size,
      valueLabelColor: const Color(0xff9b9b9b),
      valueLabelTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 12.0,
      ),
      valueLabelRadius: 10,
      maxValue: 5,
      starSpacing: 2,
      maxValueVisibility: false,
      valueLabelVisibility: false,
      animationDuration: const Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
