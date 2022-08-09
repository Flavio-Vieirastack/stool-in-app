import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in_app_ui/core/helpers/form_key_helper/form_key.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/core/module/main_module/inject.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/app_dialog.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/enum/dailog_types.dart';
import 'package:stool_in_app_ui/core/widgets/app_snackbar/app_snackbar.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in_app_ui/features/auth/presenter/sign_in/cubit/sign_in_cubit.dart';
import 'package:validatorless/validatorless.dart';

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
    with ResponsiveHelperMixin, AppSnackBar {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = FormKey();
  Timer? timer;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.get().currentState?.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state is SignInStateEmailSended) {
                showDialog(
                  context: context,
                  builder: (context) => AppDialog(
                    title: 'Muito bem!',
                    message: 'Verifique seu email',
                    context: context,
                    dialogTypes: DialogTypes.waiting,
                  ),
                );
              } else if (state is SignInStateError) {
                Navigator.of(context).pop();
                showAppSnackbar(
                  message: state.message,
                  context: context,
                  type: SnackBarType.error,
                );
              } else if (state is SignInStateEmailAccepted) {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => AppDialog(
                    title: 'Parabéns!',
                    message: 'Aguarde, só falta mais um passo',
                    context: context,
                    dialogTypes: DialogTypes.sucess,
                  ),
                );
              } else if (state is SignInStateSucess) {
                Navigator.of(context)
                    .pushReplacementNamed(RoutesConstants.signInDataRoute);
              }
            },
            child: ListView(
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
                      BlocBuilder<SignInCubit, SignInState>(
                        builder: (context, state) {
                          if (state is SignInStateLoading) {
                            return Center(
                              child: _SignInCard(
                                ignorePointer: true,
                                buttonTypes: ButtonTypes.loading,
                                formKey: formKey,
                                signInCallBack: () => cubit.makeSignIn(
                                  authEntity: AuthEntity(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                  timer: timer,
                                  formKey: formKey,
                                ),
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
                            );
                          } else {
                            return Center(
                              child: _SignInCard(
                                formKey: formKey,
                                signInCallBack: () => cubit.makeSignIn(
                                  authEntity: AuthEntity(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                  timer: timer,
                                  formKey: formKey,
                                ),
                                emailController: emailController,
                                passwordController: passwordController,
                              ),
                            );
                          }
                        },
                      ),
                    ],
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
