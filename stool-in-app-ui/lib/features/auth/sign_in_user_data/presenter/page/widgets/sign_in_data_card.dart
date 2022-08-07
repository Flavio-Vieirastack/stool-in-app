part of '../sign_in_main_data_page.dart';

class _SignInDataCard extends StatelessWidget with ResponsiveHelperMixin {
  final TextEditingController userNameController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController houseNumberController;
  final TextEditingController districtController;
  final TextEditingController cepController;
  final TextEditingController referencePointController;
  const _SignInDataCard({
    Key? key,
    required this.userNameController,
    required this.streetController,
    required this.cityController,
    required this.houseNumberController,
    required this.districtController,
    required this.cepController,
    required this.referencePointController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight *
              responsiveHeight(
                defaultMobileHeight: 0.92,
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
              center: const Alignment(0.9, -1.0),
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
                label: 'Rua',
                hint: 'Ex: Rua aparecida',
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
                label: 'Cidade',
                hint: 'Ex: São paulo',
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
                label: 'Número da casa',
                hint: 'Ex: 985',
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
                label: 'Bairro',
                hint: 'Ex: Campo belo',
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
              DropdownButton<String>(
                hint: const Text('Estado'),
                onChanged: (estado) {
                  log(estado ?? '');
                },
                items: Estados.listaEstadosSigla.map(
                  (String regiao) {
                    return DropdownMenuItem(
                      value: regiao,
                      child: Text(regiao),
                    );
                  },
                ).toList(),
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
                label: 'Cep',
                hint: 'Ex: 63100000',
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
                label: 'Ponto de referência',
                hint: 'Ex: Próximo ao posto de saúde X',
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
                buttonText: 'Cadastrar',
                onPressed: () {},
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
                    .pushReplacementNamed(RoutesConstants.signInMainRoute),
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
        );
      },
    );
  }
}
