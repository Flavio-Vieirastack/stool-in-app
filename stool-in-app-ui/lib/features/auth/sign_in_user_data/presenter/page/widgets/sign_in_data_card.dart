part of '../sign_in_main_data_page.dart';

class _SignInDataCard extends StatelessWidget with ResponsiveHelperMixin {
  const _SignInDataCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight *
              responsiveHeight(
                defaultMobileHeight: 0.8,
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
                'Porfavor preencha seus dados.',
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
              const AppTextFormField(
                label: 'Seu nome completo',
                hint: 'Ex: Felipe soares silva',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              const AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.015,
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
            ],
          ),
        );
      },
    );
  }
}
