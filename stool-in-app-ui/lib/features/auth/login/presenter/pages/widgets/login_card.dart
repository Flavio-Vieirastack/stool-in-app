part of '../login_page.dart';

class _LoginCard extends StatelessWidget with ResponsiveHelperMixin {
  final BoxConstraints constraints;
  const _LoginCard({Key? key, required this.constraints}) : super(key: key);

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
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const AppTextFormField(
            label: 'Email',
            hint: 'Ex: email@email.com',
            color: Colors.transparent,
          ),
          const SizedBox(
            height: 10,
          ),
          const AppTextFormField(
            label: 'Senha',
            hint: 'Ex: Abc@123456',
            obscureText: true,
            color: Colors.transparent,
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
            onTap: () {},
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
            onPressed: () {},
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
          RichText(
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
          )
        ],
      ),
    );
  }
}
