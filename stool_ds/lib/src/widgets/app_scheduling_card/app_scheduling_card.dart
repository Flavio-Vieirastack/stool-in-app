import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/colors/app_colors.dart';
import '../../theme/text_styles/app_text_styles.dart';
import '../app_avatar/app_avatar.dart';
import '../dialog_button/dialog_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
part './widget/shceduling_content.dart';

class AppSchedulingCard extends StatelessWidget {
  final String userUrlImage;
  final String userName;
  final String jobDate;
  final String jobHour;
  final String totalPrice;
  final String serviceDescription;
  final String userComentary;
  final bool userComentaryVisible;
  final String servicesTodo;
  final String street;
  final String city;
  final String houseNumber;
  final String district;
  final String referencePoint;
  final String userState;
  final VoidCallback cancelOnPressed;
  const AppSchedulingCard({
    Key? key,
    required this.cancelOnPressed,
    required this.city,
    required this.district,
    required this.houseNumber,
    required this.jobDate,
    required this.jobHour,
    required this.referencePoint,
    required this.serviceDescription,
    required this.servicesTodo,
    required this.street,
    required this.totalPrice,
    required this.userComentary,
    required this.userComentaryVisible,
    required this.userName,
    required this.userUrlImage,
    required this.userState,
  }) : super(key: key);
  //! Esse card vai ser usado para o prestador de serviço ver os serviços que ele tem que executar
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonRightGradientColor),
        borderRadius: BorderRadius.all(
          Radius.circular(20.dp),
        ),
        gradient: RadialGradient(
          radius: 2.dp,
          colors: [
            AppColors.grey.withOpacity(0.5),
            AppColors.black.withOpacity(0.2),
          ],
        ),
      ),
      child: _ShcedulingContent(
        userState: userState,
        cancelOnPressed: cancelOnPressed,
        city: city,
        district: district,
        houseNumber: houseNumber,
        jobDate: jobDate,
        jobHour: jobHour,
        referencePoint: referencePoint,
        serviceDescription: serviceDescription,
        servicesTodo: servicesTodo,
        street: street,
        totalPrice: totalPrice,
        userComentary: userComentary,
        userComentaryVisible: userComentaryVisible,
        userName: userName,
        userUrlImage: userUrlImage,
      ),
    );
  }
}
