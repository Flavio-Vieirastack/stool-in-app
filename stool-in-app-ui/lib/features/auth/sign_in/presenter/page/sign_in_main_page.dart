import 'package:flutter/material.dart';
import 'package:stool_in_app_logic/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_button/enum/button_types.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widget/sign_in_card.dart';
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
                        child: _SignInCard(
                          signInCallBack: () => Navigator.of(context).pushReplacementNamed(RoutesConstants.signInDataRoute),
                          emailController: emailController,
                          passwordController: passwordController,
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
