import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/shared/presenter/cubit/geo_locator_cubit/geo_locator_cubit.dart';
import 'package:stool_in/core/widgets/app_avatar/app_avatar.dart';
import 'package:stool_in/core/widgets/app_button/enum/button_types.dart';
import 'package:stool_in/core/widgets/app_dialog/app_dialog.dart';
import 'package:stool_in/core/widgets/app_dialog/enum/dailog_types.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/presenter/login/cubit/login_cubit.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_snackbar/app_snackbar.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widgets/login_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AppSnackBar {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<LoginCubit>().verifyUserEmailOnInit();
        await context.read<LoginCubit>().enableApiPasswordResetOnInit().then(
              (_) async =>
                  context.read<GeoLocatorCubit>().requestUserPermition(),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final geolocatorCubit = context.read<GeoLocatorCubit>();
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginError) {
                showAppSnackbar(
                  message: 'Ops! ${state.message}',
                  context: context,
                  type: SnackBarType.error,
                );
              } else if (state is LoginEnableApiPasswordReset) {
                showAppSnackbar(
                  message: 'Faça login com sua nova senha',
                  context: context,
                );
              } else if (state is LoginSucess) {
                Navigator.of(context)
                    .pushReplacementNamed(RoutesConstants.homeRoute);
              } else if (state is LoginGeoLocatorNotEnabled) {
                showAppSnackbar(
                  message: 'Você deve habilitar sua localização para continuar',
                  context: context,
                  duration: 3,
                  type: SnackBarType.error,
                );
                await Future.delayed(const Duration(seconds: 3));
                await geolocatorCubit.requestPermition();
              } else if (state is LoginGeoLocatorNotEnabledForever) {
                showAppSnackbar(
                  message:
                      'Por favor, habilite a localização nas suas preferências, e reinicie o app',
                  context: context,
                  duration: 3,
                  type: SnackBarType.error,
                );
              } else if (state is LoginEmailNotVerified) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AppDialog(
                    title: 'Verifique seu email',
                    context: context,
                    dialogTypes: DialogTypes.info,
                    yesButtonMessage: 'Enviar email',
                    noButtonMessage: 'Confirmei meu email',
                    yesCallBack: () => cubit.sendEmailVerification(),
                    noCallBack: () => cubit.checkEmailVerified(),
                  ),
                );
              } else if (state is LoginEmailVerified) {
                showAppSnackbar(
                  message: 'Parabéns seu email foi verificado com sucesso',
                  context: context,
                );
              }
            },
          ),
          BlocListener<GeoLocatorCubit, GeoLocatorState>(
            listener: (context, state) async {
              if (state is GeoLocatorNotEnabled) {
                showAppSnackbar(
                  message: 'Por favor, habilite a sua localização',
                  context: context,
                  type: SnackBarType.error,
                );
                await Future.delayed(const Duration(seconds: 3));
                await geolocatorCubit.requestPermition();
              } else if (state is GeoLocatorDenied) {
                showAppSnackbar(
                  message: 'Por favor, habilite a sua localização',
                  context: context,
                  type: SnackBarType.error,
                );
                await Future.delayed(const Duration(seconds: 3));
                await geolocatorCubit.requestPermition();
              } else if (state is GeoLocatorDeniedForever) {
                showAppSnackbar(
                  message:
                      'Por favor, habilite a localização nas suas preferências, e reinicie o app',
                  context: context,
                  duration: 4,
                  type: SnackBarType.error,
                );
              } else if (state is GeoLocatorSucess) {
                showAppSnackbar(
                  message: 'Parabéns, conseguimos te localizar',
                  context: context,
                );
              }
            },
          ),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              children: [
                SizedBox(
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 5.w),
                        child: Text(
                          'Bem vindo(a),',
                          style: AppTextStyles.headLine0,
                        ),
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return Center(
                              child: _LoginCard(
                                formKey: formKey,
                                ignorePointer: true,
                                buttonTypes: ButtonTypes.loading,
                                loginOrPasswordResetCallback: () =>
                                    cubit.makeLogin(
                                  validate:
                                      formKey.currentState?.validate() ?? false,
                                  authEntity: AuthEntity(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                ),
                                passwordResetCallback: () =>
                                    Navigator.of(context).pushReplacementNamed(
                                  RoutesConstants.passwordRecoveryRoute,
                                ),
                                signInCallback: () => cubit
                                    .goToSignInMainPageWithGeoLocationPermition(
                                  navigateToSignIn: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                ),
                                emailController: emailController,
                                passwordController: passwordController,
                                constraints: constraints,
                              ),
                            );
                          } else if (state is LoginEnableApiPasswordReset) {
                            return Center(
                              child: _LoginCard(
                                formKey: formKey,
                                loginOrPasswordResetCallback: () =>
                                    cubit.apiPasswordReset(
                                  validate:
                                      formKey.currentState?.validate() ?? false,
                                  authEntity: AuthEntity(
                                    email: emailController.text.trim(),
                                  ),
                                ),
                                buttonText: 'Login com nova senha',
                                passwordResetCallback: () =>
                                    Navigator.of(context).pushReplacementNamed(
                                  RoutesConstants.passwordRecoveryRoute,
                                ),
                                signInCallback: () => cubit
                                    .goToSignInMainPageWithGeoLocationPermition(
                                  navigateToSignIn: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                ),
                                emailController: emailController,
                                passwordController: passwordController,
                                constraints: constraints,
                              ),
                            );
                          } else {
                            return Center(
                              child: _LoginCard(
                                formKey: formKey,
                                loginOrPasswordResetCallback: () =>
                                    cubit.makeLogin(
                                  validate:
                                      formKey.currentState?.validate() ?? false,
                                  authEntity: AuthEntity(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                ),
                                passwordResetCallback: () =>
                                    Navigator.of(context).pushReplacementNamed(
                                  RoutesConstants.passwordRecoveryRoute,
                                ),
                                signInCallback: () => cubit
                                    .goToSignInMainPageWithGeoLocationPermition(
                                  navigateToSignIn: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                ),
                                emailController: emailController,
                                passwordController: passwordController,
                                constraints: constraints,
                              ),
                            );
                          }
                        },
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 50.h,
                            ),
                            child: Center(
                              child: AppAvatar(
                                size: 90.dp,
                              ),
                            ),
                          );
                        },
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
