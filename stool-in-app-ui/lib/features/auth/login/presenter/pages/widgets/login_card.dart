part of '../login_page.dart';

class _LoginCard extends StatelessWidget with ResponsiveHelperMixin {
  final BoxConstraints constraints;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback loginCallback;
  final VoidCallback passwordResetCallback;
  final VoidCallback signInCallback;
  const _LoginCard({
    Key? key,
    required this.constraints,
    required this.emailController,
    required this.passwordController,
    required this.loginCallback,
    required this.passwordResetCallback,
    required this.signInCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight *
          responsiveHeight(
            defaultMobileHeight: 0.45,
            defaultMobileSmallSizeHeight: 0.5,
            defaultTabletHeight: 0.5,
            constraints: constraints,
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
          radius: 1.75,
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
        children: [
          const SizedBox(
            height: 80,
          ),
          AppTextFormField(
            label: 'Email',
            hint: 'Ex: email@email.com',
            color: Colors.transparent,
            controller: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          AppTextFormField(
            label: 'Senha',
            hint: 'Ex: Abc@123456',
            obscureText: true,
            color: Colors.transparent,
            controller: passwordController,
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
          InkWell(
            onTap: passwordResetCallback,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
            height: constraints.maxHeight *
                responsiveHeight(
                  defaultMobileHeight: 0.02,
                  defaultMobileSmallSizeHeight: 0.2,
                  defaultTabletHeight: 0.2,
                  constraints: constraints,
                ),
          ),
          AppButton(
            buttonText: 'Login',
            onPressed: loginCallback,
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
          InkWell(
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
          )
        ],
      ),
    );
  }
}
