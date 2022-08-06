import 'package:flutter/material.dart';
import 'package:stool_in_app_logic/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
part './widgets/login_card.dart';

class LoginPage extends StatelessWidget with ResponsiveHelperMixin {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.1,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                    left: constraints.maxWidth *
                        responsiveWidth(
                          defaultMobileWidth: 0.05,
                          defaultMobileSmallSizeWidth: 0.01,
                          defaultTabletWidth: 0.01,
                          constraints: constraints,
                        ),
                  ),
                  child: Text(
                    'Bem vindo(a)',
                    style: AppTextStyles.headLine0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.25,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                  child: Center(
                    child: _LoginCard(
                      constraints: constraints,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.2,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                  child: const Center(
                    child: AppAvatar(
                      size: 100,
                      urlImage:
                          'https://static1.patasdacasa.com.br/articles/8/10/38/@/4864-o-cachorro-inteligente-mostra-essa-carac-articles_media_mobile-1.jpg',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
