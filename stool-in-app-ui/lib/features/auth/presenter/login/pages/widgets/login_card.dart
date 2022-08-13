part of '../login_page.dart';

class _LoginCard extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback loginOrPasswordResetCallback;
  final VoidCallback passwordResetCallback;
  final VoidCallback signInCallback;
  final ButtonTypes buttonTypes;
  final bool ignorePointer;
  final String buttonText;
  final GlobalKey<FormState> formKey;
  const _LoginCard({
    Key? key,
    required this.constraints,
    required this.emailController,
    required this.passwordController,
    required this.loginOrPasswordResetCallback,
    required this.passwordResetCallback,
    required this.signInCallback,
    required this.formKey,
    this.buttonTypes = ButtonTypes.primary,
    this.buttonText = "Login",
    this.ignorePointer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: Form(
        key: formKey,
        child: Container(
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
            borderRadius: BorderRadius.all(
              Radius.circular(30.dp),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
                controller: emailController,
                validator: Validatorless.multiple(
                  [
                    Validatorless.required('Esse campo não pode ser vazio'),
                    Validatorless.email('Digite um email válido')
                  ],
                ),
              ),
              SizedBox(
                height: 2.h
              ),
              AppTextFormField(
                label: 'Senha',
                hint: 'Ex: Abc@123456',
                obscureText: true,
                color: Colors.transparent,
                controller: passwordController,
                validator: Validatorless.required(
                  'Esse campo não pode ficar vazio',
                ),
              ),
              SizedBox(
                height: 2.h
              ),
              InkWell(
                onTap: passwordResetCallback,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Esqueceu sua senha?',
                      style: AppTextStyles.headLine4Italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h
              ),
              AppButton(
                buttonText: buttonText,
                onPressed: loginOrPasswordResetCallback,
                buttonTypes: buttonTypes,
              ),
              SizedBox(
                height: 2.h
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: InkWell(
                  onTap: signInCallback,
                  child: RichText(
                    text: TextSpan(
                      text: 'Ainda não tem uma conta? ',
                      style: AppTextStyles.headLine4,
                      children: [
                        TextSpan(
                          text: 'Cadaste-se',
                          style: AppTextStyles.headLine1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
