part of '../password_reset_page.dart';

class _PasswordResetCard extends StatelessWidget with ResponsiveHelperMixin {
  final TextEditingController emailController;
  final VoidCallback sendCallback;
  const _PasswordResetCard({
    Key? key,
    required this.emailController,
    required this.sendCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight *
              responsiveHeight(
                defaultMobileHeight: 0.4,
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
                      defaultMobileHeight: 0.02,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              Text(
                'Nós enviaremos um link para você',
                style: AppTextStyles.headLine1,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.04,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              AppTextFormField(
                label: 'Email',
                hint: 'Ex: email@email.com',
                color: Colors.transparent,
                controller: emailController,
              ),
              SizedBox(
                height: constraints.maxHeight *
                    responsiveHeight(
                      defaultMobileHeight: 0.04,
                      defaultMobileSmallSizeHeight: 0.2,
                      defaultTabletHeight: 0.2,
                      constraints: constraints,
                    ),
              ),
              AppButton(
                buttonText: 'Enviar',
                onPressed: sendCallback,
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
                buttonTypes: ButtonTypes.secondary,
                onPressed: () => Navigator.of(context).pushReplacementNamed(
                  RoutesConstants.loginRoute,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
