import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/exports/app_exports.dart';

part './widgets/home_body.dart';
part './widgets/coin_widget.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8.dp, 70.dp, 8.dp, 0),
            child: Row(
              children: [
                const AppAvatar(
                  urlImage:
                      'https://skycms.s3.amazonaws.com/images/5495100/cachorro-card-1.png',
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  width: 45.w,
                  child: Text(
                    'Flavio Emerson gomes Vieira',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headLine0,
                  ),
                ),
                const Spacer(),
                Visibility(
                  visible: false,
                  child: Row(
                    children: [
                      LottieBuilder.asset(
                        LottieConstants.lottieCoin,
                        width: 35.dp,
                      ),
                      _coin(
                        onTap: () {},
                        coins: '800',
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        LottieConstants.lottiePremium,
                        width: 10.w,
                      ),
                      Text(
                        'Premium',
                        style: AppTextStyles.headLine4Blue,
                      )
                    ],
                  ),
                ),
                Visibility(
                  child: Row(
                    children: [
                      LottieBuilder.asset(
                        LottieConstants.lottiePremium,
                        width: 8.w,
                      ),
                      LottieBuilder.asset(
                        LottieConstants.lottieCoin,
                        width: 28.dp,
                      ),
                      _coin(
                        onTap: () {},
                        coins: '8000000',
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Cadastrar',
                      style: AppTextStyles.headLine4Blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
