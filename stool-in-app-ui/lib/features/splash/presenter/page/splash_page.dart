import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';



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
        } else if (state is SplashGoToHomePage) {
          Navigator.of(context).pushReplacementNamed(RoutesConstants.homeRoute);
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
            const AppProgressIndicator(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
