import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../exports/app_exports.dart';

part './widget/password_reset_card.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage>
    with AppSnackBar {
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
          } else if (state is PasswordResetError) {
            showAppSnackbar(
              message: 'Esse email não existe na nossa base de dados',
              context: context,
              type: SnackBarType.error,
            );
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
                          top: 20.h,
                          left: 5.w,
                        ),
                        child: Text(
                          'Informe seu email,',
                          style: AppTextStyles.headLine0,
                        ),
                      ),
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
                                sendCallback: () => cubit.firebasePasswordReset(
                                  validate:
                                      formKey.currentState?.validate() ?? false,
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
