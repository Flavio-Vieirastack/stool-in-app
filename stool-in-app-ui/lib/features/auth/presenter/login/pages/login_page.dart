import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';
import 'package:stool_in_app_ui/core/widgets/app_button/enum/button_types.dart';
import 'package:stool_in_app_ui/core/widgets/app_snackbar/app_snackbar.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/presenter/login/cubit/login_cubit.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widgets/login_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ResponsiveHelperMixin, AppSnackBar {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginCubit>().enableApiPasswordResetOnInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
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
                          'Bem vindo(a),',
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
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return Center(
                                child: _LoginCard(
                                  ignorePointer: true,
                                  buttonTypes: ButtonTypes.loading,
                                  loginOrPasswordResetCallback: () =>
                                      cubit.makeLogin(
                                    authEntity: AuthEntity(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  ),
                                  passwordResetCallback: () =>
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                    RoutesConstants.passwordRecoveryRoute,
                                  ),
                                  signInCallback: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  constraints: constraints,
                                ),
                              );
                            } else if (state is LoginEnableApiPasswordReset) {
                              return Center(
                                child: _LoginCard(
                                  loginOrPasswordResetCallback: () =>
                                      cubit.apiPasswordReset(
                                    authEntity: AuthEntity(
                                      email: emailController.text.trim(),
                                    ),
                                  ),
                                  buttonText: 'Login com nova senha',
                                  passwordResetCallback: () =>
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                    RoutesConstants.passwordRecoveryRoute,
                                  ),
                                  signInCallback: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  constraints: constraints,
                                ),
                              );
                            } else {
                              return Center(
                                child: _LoginCard(
                                  loginOrPasswordResetCallback: () =>
                                      cubit.makeLogin(
                                    authEntity: AuthEntity(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  ),
                                  passwordResetCallback: () =>
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                    RoutesConstants.passwordRecoveryRoute,
                                  ),
                                  signInCallback: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RoutesConstants.signInMainRoute,
                                  ),
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  constraints: constraints,
                                ),
                              );
                            }
                          },
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
      ),
    );
  }
}
