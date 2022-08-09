import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/widgets/app_button/enum/button_types.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/presenter/password_reset/cubit/password_reset_cubit.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widget/password_reset_card.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage>
    with ResponsiveHelperMixin {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PasswordResetCubit>();
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: BlocListener<PasswordResetCubit, PasswordResetState>(
        listener: (context, state) {
          if (state is PasswordResetRedirectToLogin) {
            Navigator.of(context)
                .pushReplacementNamed(RoutesConstants.loginRoute);
          }
        },
        child: LayoutBuilder(
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
                          'Informe seu email,',
                          style: AppTextStyles.headLine0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: constraints.maxHeight *
                              responsiveHeight(
                                defaultMobileHeight: 0.09,
                                defaultMobileSmallSizeHeight: 0.8,
                                defaultTabletHeight: 0.8,
                                constraints: constraints,
                              ),
                        ),
                        child:
                            BlocBuilder<PasswordResetCubit, PasswordResetState>(
                          builder: (context, state) {
                            if (state is PasswordResetLoading) {
                              return IgnorePointer(
                                ignoring: true,
                                child: Center(
                                  child: _PasswordResetCard(
                                    buttonTypes: ButtonTypes.loading,
                                    formKey: formKey,
                                    sendCallback: () {},
                                    emailController: emailController,
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: _PasswordResetCard(
                                  formKey: formKey,
                                  sendCallback: () =>
                                      cubit.firebasePasswordReset(
                                    validate: formKey.currentState?.validate() ?? false,
                                    authEntity: AuthEntity(
                                      email: emailController.text.trim(),
                                    ),
                                  ),
                                  emailController: emailController,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
