import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/exports/app_exports.dart';

part './widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SharedPreferencesHelper {
  String? userImage;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userImage = await getString(key: KeysConstants.userPhotoUrl);

      //context.read<HomeCubit>().getServiceProviders(pageQuantity: 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child: SafeArea(
              child: Row(
                children: [
                  const AppAvatar(
                    urlImage:
                        'https://skycms.s3.amazonaws.com/images/5495100/cachorro-card-1.png',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Flavio Vieira',
                    style: AppTextStyles.headLine0,
                  ),
                  const Spacer(),
                  Visibility(
                    child: Row(
                      children: [
                        LottieBuilder.asset(
                          LottieConstants.lottieCoin,
                          width: 38.dp,
                        ),
                        Text(
                          '800',
                          style: AppTextStyles.headLine3,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
