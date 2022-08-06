import 'package:flutter/material.dart';
import 'package:stool_in_app_logic/core/helpers/responsive/responsive_helper_mixin.dart';

import '../../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';

class SignInCard extends StatelessWidget with ResponsiveHelperMixin {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignInCard({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight *
              responsiveHeight(
                defaultMobileHeight: 0.5,
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
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Informe seu email e senha',
                style: AppTextStyles.headLine1,
              ),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                label: 'Digite novamente sua senha',
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
            ],
          ),
        );
      },
    );
  }
}
