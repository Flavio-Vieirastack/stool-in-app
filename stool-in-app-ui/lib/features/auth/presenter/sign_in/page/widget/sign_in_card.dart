part of '../sign_in_main_page.dart';

class _SignInCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback signInCallBack;
  final GlobalKey<FormState> formKey;
  final ButtonTypes buttonTypes;
  final bool ignorePointer;
  const _SignInCard({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.signInCallBack,
    required this.formKey,
    this.buttonTypes = ButtonTypes.primary,
    this.ignorePointer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(8.dp),
              width: Adaptive.w(90),
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
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    'Informe seu email e senha',
                    style: AppTextStyles.headLine1,
                  ),
                  SizedBox(height: 2.h),
                  AppTextFormField(
                    label: 'Email',
                    hint: 'Ex: email@email.com',
                    color: Colors.transparent,
                    controller: emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('Esse campo não pode ficar vazio'),
                      Validatorless.email('Informe um email válido'),
                    ]),
                  ),
                  SizedBox(height: 2.h),
                  AppTextFormField(
                    label: 'Senha',
                    hint: 'Ex: Abc@123456',
                    obscureText: true,
                    color: Colors.transparent,
                    controller: passwordController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                          'Esse campo não pode ficar vazio',
                        ),
                        Validatorless.min(
                          6,
                          'A senha deve conter mais de 6 caractéres',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  AppTextFormField(
                    label: 'Digite novamente sua senha',
                    hint: 'Ex: Abc@123456',
                    obscureText: true,
                    color: Colors.transparent,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.compare(
                          passwordController,
                          'Senhas não conferem',
                        ),
                        Validatorless.required(
                            'Esse campo não pode ficar vazio')
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(height: 2.h),
                  AppButton(
                    buttonText: 'Cadastrar',
                    onPressed: signInCallBack,
                    buttonTypes: buttonTypes,
                  ),
                  SizedBox(height: 2.h),
                  AppButton(
                    buttonText: 'Voltar',
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(RoutesConstants.loginRoute),
                    buttonTypes: ButtonTypes.secondary,
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
