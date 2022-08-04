import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';

import '../../helpers/theme/text_styles/app_text_styles.dart';
import '../ratting_stars/app_ratting_stars.dart';
part './widget/service_provider_content.dart';

class ServiceProviderCards extends StatelessWidget {
  final String userUrlImage;
  final String userName;
  final String userVotes;
  final String userServicesExecuted;
  final String userDistance;
  final VoidCallback onPressed;
  const ServiceProviderCards(
      {Key? key,
      required this.userDistance,
      required this.userName,
      required this.userServicesExecuted,
      required this.userUrlImage,
      required this.userVotes,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.buttonLeftGradientColor.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: RadialGradient(
              radius: 2,
              colors: [
                AppColors.grey.withOpacity(0.5),
                AppColors.black.withOpacity(0.3),
              ],
            ),
          ),
          child: _ServiceProviderContent(
            userDistance: userDistance,
            userName: userName,
            userServicesExecuted: userServicesExecuted,
            userUrlImage: userUrlImage,
            userVotes: userVotes,
          ),
        ),
      ),
    );
  }
}
