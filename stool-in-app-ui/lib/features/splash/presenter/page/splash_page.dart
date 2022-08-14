import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/assets_constants.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in/features/splash/presenter/cubit/splash_cubit.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<SplashCubit>().goToOnBoardingPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoToOnBoardingPage) {
          Navigator.of(context).pushReplacementNamed(
            RoutesConstants.onBoardingRoute,
          );
        } else if (state is SplashGoToLoginPage) {
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstants.loginRoute);
        } else if(state is SplashGoToHomePage) {
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstants.homeRoute);
        } else if (state is SplashGoToUserDataPage) {
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstants.signInDataRoute);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AssetsConstants.logoWhite),
            SizedBox(
              height: 20.h,
            ),
            const Spacer(),
            CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.black,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
