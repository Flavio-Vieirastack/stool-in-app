import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:stool_in_app_ui/core/constants/assets_constants.dart';
import 'package:stool_in_app_ui/features/splash/presenter/cubit/splash_cubit.dart';

import '../../../../core/helpers/theme/colors/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().goToOnBoardingPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoToOnBoardingPage) {
          
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.greyScaleDark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AssetsConstants.logoWhite),
            const Spacer(),
            const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
