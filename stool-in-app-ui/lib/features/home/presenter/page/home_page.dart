import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/constants/lottie_constants.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/widgets/service_provider_cards/service_provider_cards.dart';
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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 15.h,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.dp),
            ),
          ),
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            title: const Text('UserName'),
            background: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.dp),
              ),
              child: Image.network(
                userImage ??
                    'https://cdn.pixabay.com/photo/2013/07/13/12/07/avatar-159236_960_720.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: [
            Padding(
              // Esse icone deve aparecer para provedores
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.dp),
                        ),
                      ),
                      child: LottieBuilder.asset(
                        LottieConstants.lottiePremium,
                        width: 30.dp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const _HomeBody()
      ],
    ));
  }
}
