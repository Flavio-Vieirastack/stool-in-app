import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/exports/app_exports.dart';

class SearchWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SearchWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 5.h,
          width: Adaptive.w(90),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(30.dp),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buscar no aplicativo',
                  style: AppTextStyles.headLine4,
                ),
                Icon(
                  Icons.search,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
