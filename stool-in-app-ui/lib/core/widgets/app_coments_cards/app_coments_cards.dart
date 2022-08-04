import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';
import 'package:stool_in_app_ui/core/widgets/ratting_stars/app_ratting_stars.dart';

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
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: RadialGradient(
            radius: 2,
            colors: [
              AppColors.grey.withOpacity(0.5),
              AppColors.black.withOpacity(0.3),
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 AppAvatar(urlImage: userUrlImage),
                const SizedBox(
                  width: 5,
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Comentário:',
              style: TextStyle(
                  color: AppColors.buttonLeftGradientColor,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userComent,
              style: AppTextStyles.headLine2,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AppRattingStars(
                value: votes,
                onValueChanged: (v) {},
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
