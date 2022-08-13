part of '../password_reset_page.dart';

class _PasswordResetCard extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback sendCallback;
  final ButtonTypes buttonTypes;
  final GlobalKey<FormState> formKey;
  const _PasswordResetCard({
    Key? key,
    required this.emailController,
    required this.sendCallback,
    required this.formKey,
    this.buttonTypes = ButtonTypes.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: Adaptive.w(90),
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              gradient: RadialGradient(
                radius: 1.9,
                center: const Alignment(0.9, -1.5),
                colors: <Color>[
                  AppColors.grey.withOpacity(0.6),
                  AppColors.black,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30.dp),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h
                ),
                Text(
                  'Nós enviaremos um link para você.',
                  style: AppTextStyles.headLine1,
                ),
                SizedBox(
                  height: 4.h
                ),
                AppTextFormField(
                  label: 'Email',
                  hint: 'Ex: email@email.com',
                  color: Colors.transparent,
                  controller: emailController,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required(
                        'Esse campo não pode ficar vazio',
                      ),
                      Validatorless.email(
                        'Email inválido',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h
                ),
                AppButton(
                  buttonText: 'Enviar',
                  onPressed: sendCallback,
                  buttonTypes: buttonTypes,
                ),
                SizedBox(
                  height: 2.h
                ),
                AppButton(
                  buttonText: 'Voltar',
                  buttonTypes: ButtonTypes.secondary,
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    RoutesConstants.loginRoute,
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
