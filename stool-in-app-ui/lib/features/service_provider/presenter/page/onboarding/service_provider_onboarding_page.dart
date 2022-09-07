
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';

class ServiceProviderOnboardingPage extends StatefulWidget {
  const ServiceProviderOnboardingPage({Key? key}) : super(key: key);

  @override
  State<ServiceProviderOnboardingPage> createState() =>
      _ServiceProviderOnboardingPageState();
}

class _ServiceProviderOnboardingPageState
    extends State<ServiceProviderOnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                _controller.forward();
                setState(() {
                  visible = true;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 75.h),
            child: Center(
              child: Visibility(
                visible: visible,
                child: FadeTransition(
                  opacity: _animation,
                  child: Column(
                    children: [
                      const AppButton(buttonText: 'Sim'),
                      SizedBox(
                        height: 1.h,
                      ),
                      AppButton(
                        buttonText: 'Não',
                        buttonTypes: ButtonTypes.secondary,
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(RoutesConstants.homeRoute),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
