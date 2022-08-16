import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AppCategoryCard extends StatelessWidget {
  const AppCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 3.h),
      child: GestureDetector(
        onTap: () {},
        child: Container()
      ),
    );
  }
}
