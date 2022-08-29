import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:stool_in/exports/app_exports.dart';

class ServiceProviderOnboardingPage extends StatelessWidget {
  const ServiceProviderOnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.headLine0;
    const duration = Duration(milliseconds: 130);
    const textAlign = TextAlign.center;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AssetsConstants.serviceProviderImage,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 1.0],
                colors: [
                  AppColors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Um mundo de oportunidades a um toque de você.',
                  textStyle: textStyle,
                  speed: duration,
                  textAlign: textAlign,
                ),
                TypewriterAnimatedText(
                  'Demonstre seus talentos e ainda ganhe aquele "dinheirinho" extra.',
                  textStyle: textStyle,
                  speed: duration,
                  textAlign: textAlign,
                ),
                TypewriterAnimatedText(
                  'Deseja se tornar um provedor de serviços StoolIn?',
                  textStyle: textStyle,
                  speed: duration,
                  textAlign: textAlign,
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                log('finished');
              },
            ),
          )
        ],
      ),
    );
  }
}
