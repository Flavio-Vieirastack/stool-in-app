import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_sizer/flutter_sizer.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';
import '../app_avatar/app_avatar.dart';
import '../ratting_stars/app_ratting_stars.dart';

class AppComentsCards extends StatelessWidget {
  final String userUrlImage;
  final String userName;
  final String userComent;
  final double votes;
  const AppComentsCards({
    Key? key,
    required this.userUrlImage,
    required this.userName,
    required this.userComent,
    required this.votes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.buttonLeftGradientColor),
          borderRadius: BorderRadius.all(
            Radius.circular(20.dp),
          ),
          gradient: RadialGradient(
            radius: 2,
            colors: [
              AppColors.grey.withOpacity(0.5),
              AppColors.black.withOpacity(0.3),
            ],
          )),
      child: Padding(
        padding: EdgeInsets.all(15.0.dp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppAvatar(
                  urlImage: userUrlImage,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: AutoSizeText(
                    userName,
                    style: AppTextStyles.headLine1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    maxFontSize: 18,
                    minFontSize: 17,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Comentário:',
              style: TextStyle(
                  color: AppColors.buttonLeftGradientColor,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: 2.w,
            ),
            Text(
              userComent,
              style: AppTextStyles.headLine2,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AppRattingStars(
                value: votes,
                onValueChanged: (v) {},
                size: 10.dp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
