import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/ratting_stars/app_ratting_stars.dart';

class ServiceProviderContent extends StatelessWidget {
  const ServiceProviderContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://ichef.bbci.co.uk/news/976/cpsprodpb/17638/production/_124800859_gettyimages-817514614.jpg',
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              SizedBox(
                width: 200,
                child: AutoSizeText(
                  'Nome do usuário',
                  maxLines: 1,
                  maxFontSize: 16,
                  minFontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.headLine3,
                ),
              ),
              AppRattingStars(
                value: 3,
                size: 10,
                onValueChanged: (value) {},
              )
            ],
          ),
        )
      ],
    );
  }
}
