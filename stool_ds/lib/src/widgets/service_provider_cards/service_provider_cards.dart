import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/src/widgets/service_provider_cards/params/service_provider_cards_params.dart';
import 'package:stool_in_core/stool_in_core.dart';
import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';
import '../app_avatar/app_avatar.dart';
import '../ratting_stars/app_ratting_stars.dart';
part './widget/service_provider_content.dart';

@immutable
class ServiceProviderCards extends StatelessWidget {
  final ServiceProviderCardsParams serviceProviderCardsParams;
  const ServiceProviderCards({
    Key? key,
    required this.serviceProviderCardsParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: serviceProviderCardsParams.cardOnTap,
      child: Padding(
        padding: EdgeInsets.all(8.0.dp),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.buttonLeftGradientColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.dp),
            ),
            gradient: RadialGradient(
              radius: 2,
              colors: [
                AppColors.categoryCardBackgroundColor,
                AppColors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: _ServiceProviderContent(
            serviceProviderCardsParams: serviceProviderCardsParams,
          ),
        ),
      ),
    );
  }
}
