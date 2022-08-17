import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/constants/lottie_constants.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/widgets/app_category_card/app_category_card.dart';
import 'package:stool_in/core/widgets/menu_buttons/app_menu_button.dart';
import 'package:stool_in/core/widgets/service_provider_cards/service_provider_cards.dart';

import '../../../../core/helpers/theme/colors/app_colors.dart';
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
      appBar: AppBar(
        title: Text(
          'Flavio Vieira',
          style: AppTextStyles.headLine1,
        ),
        elevation: 22,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100.dp),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15.h),
          child: Container(
            color: Colors.red,
          ),
        ),
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100.dp),
          ),
          child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.petz.com.br/blog/wp-content/uploads/2020/07/raca-de-cachorro-muito-popular-no-brasil-3-1280x720.jpg',
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child:  _HomeBody(),
          ),
        ],
      ),
    );
  }
}
