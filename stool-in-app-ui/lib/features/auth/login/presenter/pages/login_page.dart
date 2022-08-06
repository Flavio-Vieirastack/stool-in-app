import 'package:flutter/material.dart';
import 'package:stool_in_app_logic/core/constants/routes_constants.dart';
import 'package:stool_in_app_logic/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';
import 'package:stool_in_app_ui/features/auth/login/presenter/pages/widgets/login_card.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ResponsiveHelperMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: [
              SizedBox(
                height: constraints.maxHeight,
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
                        bottom: constraints.maxHeight *
                            responsiveHeight(
                              defaultMobileHeight: 0.05,
                              defaultMobileSmallSizeHeight: 0.8,
                              defaultTabletHeight: 0.8,
                              constraints: constraints,
                            ),
                      ),
                      child: Center(
                        child: LoginCard(
                          loginCallback: () {},
                          passwordResetCallback: () {},
                          signInCallback: () =>
                              Navigator.of(context).pushReplacementNamed(
                            RoutesConstants.signInMainRoute,
                          ),
                          emailController: emailController,
                          passwordController: passwordController,
                          constraints: constraints,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: constraints.maxHeight *
                            responsiveHeight(
                              defaultMobileHeight: 0.5,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
