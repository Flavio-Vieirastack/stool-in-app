import 'package:flutter/material.dart';
import 'package:stool_in_app_logic/core/helpers/responsive/responsive_helper_mixin.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_avatar/app_avatar.dart';
import '../../../login/presenter/pages/widgets/login_card.dart';

class SignInMainPage extends StatefulWidget {
  const SignInMainPage({Key? key}) : super(key: key);

  @override
  State<SignInMainPage> createState() => _SignInMainPageState();
}

class _SignInMainPageState extends State<SignInMainPage>
    with ResponsiveHelperMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                        'Vamos começar,',
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
                          signInCallback: () {},
                          emailController: emailController,
                          passwordController: passwordController,
                          constraints: constraints,
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
