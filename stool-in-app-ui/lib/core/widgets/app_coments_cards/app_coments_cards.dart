import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/ratting_stars/app_ratting_stars.dart';

class AppComentsCards extends StatelessWidget {
  const AppComentsCards({Key? key}) : super(key: key);

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
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: AutoSizeText(
                    'José pereira nogueira de oliveira silva filho',
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
                decoration: TextDecoration.underline
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: AppTextStyles.headLine2,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AppRattingStars(
                value: 3,
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
