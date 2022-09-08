import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import 'package:validatorless/validatorless.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

part './widget/sign_in_card.dart';
@immutable
class SignInMainPage extends StatefulWidget {
  const SignInMainPage({Key? key}) : super(key: key);

  @override
  State<SignInMainPage> createState() => _SignInMainPageState();
}
class _SignInMainPageState extends State<SignInMainPage> with AppSnackBar {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
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
            listener: (context, state) async {
              if (state is SignInStateEmailSended) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AppDialog(
                    title: 'Muito bem!',
                    message: 'Verifique seu email',
                    context: context,
                    dialogTypes: DialogTypes.waiting,
                    yesCallBack: () => cubit.checkEmailVerifiedAndSaveUserInApi(
                      authEntity: AuthEntity(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    ),
                    noCallBack: () => cubit.notRecievedEmail(),
                  ),
                );
              } else if (state is SignInStateError) {
                Navigator.of(context).pop();
                showAppSnackbar(
                  message: state.message,
                  context: context,
                  type: SnackBarType.error,
                );
                passwordController.clear();
                emailController.clear();
              } else if (state is SignInStateEmailAccepted) {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AppDialog(
                    title: 'Parabéns!',
                    message: 'Aguarde, só falta mais um passo',
                    context: context,
                    dialogTypes: DialogTypes.sucess,
                  ),
                );
              } else if (state is SignInStateSucess) {
                await Future.delayed(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacementNamed(
                    RoutesConstants.signInDataRoute,
                  ),
                );
              } else if (state is SignInStateSendVerificationEmailError) {
                Navigator.of(context).pop();
                showAppSnackbar(
                  message: state.message,
                  context: context,
                  type: SnackBarType.error,
                );
                emailController.clear();
                passwordController.clear();
              } else if (state is SignInEmailNotVerified) {
                showAppSnackbar(
                  message: 'Você ainda não verificou seu email',
                  context: context,
                  type: SnackBarType.error,
                );
                await Future.delayed(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pop(),
                );
              } else if (state is SignInStateEmailNotRecieved) {
                Navigator.of(context).pop();
                showAppSnackbar(
                  message: 'Por favor, tente novamente',
                  context: context,
                );
                emailController.clear();
              }
            },
            child: ListView(
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 10.w),
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
                                  validate:
                                      formKey.currentState?.validate() ?? false,
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
                                  validate:
                                      formKey.currentState?.validate() ?? false,
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
