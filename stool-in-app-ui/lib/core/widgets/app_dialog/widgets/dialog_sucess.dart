import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in_app_ui/core/constants/lottie_constants.dart';

class DialogSucess {
  Widget sucess({required String message}) {
    return Column(
      children: [
        LottieBuilder.asset(
          LottieConstants.lottieSucess,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(message)
      ],
    );
  }
}
