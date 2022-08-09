part of '../sign_in_main_page.dart';

class _SignInCard extends StatelessWidget with ResponsiveHelperMixin {
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
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.65,
                      defaultMobileSmallSizeHeight: 0.5,
                      defaultTabletHeight: 0.5,
                      constraints: constraints,
                    ),
              ),
              width: constraints.maxWidth *
                  responsiveWidth(
                    defaultMobileWidth: 0.9,
                    defaultMobileSmallSizeWidth: 0.8,
                    defaultTabletWidth: 0.8,
                    constraints: constraints,
                  ),
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
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.025,
                          defaultMobileSmallSizeHeight: 0.09,
                          defaultTabletHeight: 0.09,
                          constraints: constraints,
                        ),
                  ),
                  Text(
                    'Informe seu email e senha',
                    style: AppTextStyles.headLine1,
                  ),
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.04,
                          defaultMobileSmallSizeHeight: 0.025,
                          defaultTabletHeight: 0.025,
                          constraints: constraints,
                        ),
                  ),
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
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.02,
                          defaultMobileSmallSizeHeight: 0.09,
                          defaultTabletHeight: 0.09,
                          constraints: constraints,
                        ),
                  ),
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
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.02,
                          defaultMobileSmallSizeHeight: 0.09,
                          defaultTabletHeight: 0.09,
                          constraints: constraints,
                        ),
                  ),
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
                      )),
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.02,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.02,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                  AppButton(
                    buttonText: 'Cadastrar',
                    onPressed: signInCallBack,
                    buttonTypes: buttonTypes,
                  ),
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.02,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                  AppButton(
                    buttonText: 'Voltar',
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(RoutesConstants.loginRoute),
                    buttonTypes: ButtonTypes.secondary,
                  ),
                  SizedBox(
                    height: constraints.maxHeight *
                        responsiveHeight(
                          defaultMobileHeight: 0.03,
                          defaultMobileSmallSizeHeight: 0.2,
                          defaultTabletHeight: 0.2,
                          constraints: constraints,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
