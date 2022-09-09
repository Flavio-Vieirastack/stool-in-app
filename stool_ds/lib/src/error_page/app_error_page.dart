import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';

class AppErrorPage extends StatelessWidget {
  const AppErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          LottieConstants.lottieErrorPage,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Ops! Ocorreu um erro',
          style: AppTextStyles.headLine0,
        ),
      ],
    );
  }
}
