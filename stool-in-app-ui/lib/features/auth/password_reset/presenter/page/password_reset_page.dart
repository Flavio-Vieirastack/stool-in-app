import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';

class PasswordResetPage extends StatefulWidget {

  const PasswordResetPage({ Key? key }) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> with ResponsiveHelperMixin {
   @override
   Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
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
                        child: Container()
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