import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../exports/app_exports.dart';

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
        context.read<LoginCubit>().verifyUserEmailOnInit().whenComplete(
              () => context.read<LoginCubit>().getUserImageOnInit(),
            );
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
                passwordController.clear();
                emailController.clear();
                Navigator.of(context).maybePop();
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
                    title: 'Você não verificou seu email',
                    context: context,
                    dialogTypes: DialogTypes.info,
                    yesButtonMessage: 'Enviar email',
                    noButtonMessage: 'Confirmei',
                    yesCallBack: () => cubit.sendEmailVerification(),
                    noCallBack: () => cubit.checkEmailVerified(),
                  ),
                );
              } else if (state is LoginEmailVerified) {
                Navigator.of(context).pop();
                showAppSnackbar(
                  message: 'Parabéns seu email foi verificado com sucesso',
                  context: context,
                );
                await Future.delayed(
                  const Duration(seconds: 3),
                  () => Navigator.of(context)
                      .pushReplacementNamed(RoutesConstants.signInDataRoute),
                );
              } else if (state is LoginEmailSended) {
                showAppSnackbar(
                  message: 'Enviamos um email para você',
                  context: context,
                );
              } else if (state is LoginEmailNoSended) {
                Navigator.of(context).pop();
                showAppSnackbar(
                    message: state.message,
                    context: context,
                    type: SnackBarType.error);
              } else if (state is LoginEmailRequestNotVerified) {
                showAppSnackbar(
                    message: 'Você ainda não verificou seu email',
                    context: context,
                    type: SnackBarType.error);
              } else if (state is LoginSignInStateError) {
                showAppSnackbar(
                    message:
                        'Ops! Ocorreu um erro ao fazer seu cadastro, por favor se cadastre novamente.',
                    context: context,
                    type: SnackBarType.error,
                    duration: 4);
                await Future.delayed(
                  const Duration(seconds: 4),
                  () => Navigator.of(context)
                      .pushReplacementNamed(RoutesConstants.signInMainRoute),
                );
              } else if (state is LoginSignInStateSucess) {
                showAppSnackbar(
                    message:
                        'Cadastro realizado com sucesso, vamos ao próximo passo.',
                    context: context,
                    duration: 4);
                await Future.delayed(
                  const Duration(seconds: 4),
                  () => Navigator.of(context)
                      .pushReplacementNamed(RoutesConstants.signInDataRoute),
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
                                    password: passwordController.text.trim(),
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
                          if (state is LoginInitial) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEmailNoSended) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEmailNotVerified) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEmailRequestNotVerified) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEmailSended) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEmailVerified) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginEnableApiPasswordReset) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginError) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginGeoLocatorNotEnabled) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state
                              is LoginGeoLocatorNotEnabledForever) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginLoading) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else if (state is LoginSignInStateError) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              child: Center(
                                child: AppAvatar(
                                  size: 90.dp,
                                  urlImage: state.urlImage,
                                ),
                              ),
                            );
                          } else {
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
                          }
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
