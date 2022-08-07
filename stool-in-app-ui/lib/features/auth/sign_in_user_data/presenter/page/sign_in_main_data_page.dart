import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_avatar/app_avatar.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_button/enum/button_types.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widgets/sign_in_data_card.dart';

class SignInMainDataPage extends StatefulWidget {
  const SignInMainDataPage({Key? key}) : super(key: key);

  @override
  State<SignInMainDataPage> createState() => _SignInMainDataPageState();
}

class _SignInMainDataPageState extends State<SignInMainDataPage>
    with ResponsiveHelperMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.1),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight *
                      responsiveHeight(
                        defaultMobileHeight: 0.01,
                        defaultMobileSmallSizeHeight: 0.1,
                        defaultTabletHeight: 0.1,
                        constraints: constraints,
                      ),
                ),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight *
                              responsiveHeight(
                                defaultMobileHeight: 0.001,
                                defaultMobileSmallSizeHeight: 0.2,
                                defaultTabletHeight: 0.2,
                                constraints: constraints,
                              ),
                          left: constraints.maxWidth *
                              responsiveWidth(
                                defaultMobileWidth: 0.02,
                                defaultMobileSmallSizeWidth: 0.01,
                                defaultTabletWidth: 0.01,
                                constraints: constraints,
                              ),
                        ),
                        child: Text(
                          'Para finalizar,',
                          style: AppTextStyles.headLine0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight *
                              responsiveHeight(
                                defaultMobileHeight: 0.1,
                                defaultMobileSmallSizeHeight: 0.8,
                                defaultTabletHeight: 0.8,
                                constraints: constraints,
                              ),
                        ),
                        child: const Center(
                          child: _SignInDataCard(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: constraints.maxHeight *
                              responsiveHeight(
                                defaultMobileHeight: 0.79,
                                defaultMobileSmallSizeHeight: 0.2,
                                defaultTabletHeight: 0.2,
                                constraints: constraints,
                              ),
                        ),
                        child: const Center(
                          child: AppAvatar(
                            size: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
