part of '../sign_in_main_data_page.dart';

class _SignInDataCard extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController houseNumberController;
  final TextEditingController districtController;
  final TextEditingController cepController;
  final TextEditingController referencePointController;
  final String statesDropDownLabel;
  final void Function(String?)? onChanged;
  final VoidCallback signInCallBack;
  final ButtonTypes buttonTypes;
  final GlobalKey<FormState> formKey;
  final String? urlImage;
  final bool ignoring;
  const _SignInDataCard({
    Key? key,
    required this.userNameController,
    this.ignoring = false,
    required this.streetController,
    required this.cityController,
    required this.houseNumberController,
    required this.districtController,
    required this.cepController,
    required this.referencePointController,
    required this.statesDropDownLabel,
    required this.signInCallBack,
    required this.formKey,
    this.buttonTypes = ButtonTypes.primary,
    this.onChanged,
    this.urlImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IgnorePointer(
          ignoring: ignoring,
          child: Form(
            key: formKey,
            child: Container(
              width: Adaptive.w(90),
              decoration: BoxDecoration(
                color: AppColors.black,
                gradient: RadialGradient(
                  radius: 1.9.dp,
                  center: const Alignment(0.9, -1.0),
                  colors: <Color>[
                    AppColors.grey.withOpacity(0.6),
                    AppColors.black,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.dp),
                ),
              ),
              child: BlocBuilder<FirebaseStorageCubit, FirebaseStorageState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                         SizedBox(
                          height: 1.5.h,
                        ),
                        if (state is FirebaseStorageLoading)
                           Center(
                            child: AppAvatar(
                              size: 80.dp,
                              isLoading: true,
                              urlImage: urlImage,
                            ),
                          ),
                        if (state is FirebaseStorageInitial)
                           Center(
                            child: AppAvatar(
                              size: 80.dp,
                            ),
                          ),
                        if (state is FirebaseStorageSucess)
                          Center(
                            child: AppAvatar(
                              size: 80.dp,
                              urlImage: state.userUrlImage,
                            ),
                          ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Text(
                          'Por favor preencha seus dados.',
                          style: AppTextStyles.headLine1,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Seu nome completo',
                          hint: 'Ex: Felipe soares silva',
                          controller: userNameController,
                          color: Colors.transparent,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                              Validatorless.min(
                                5,
                                'Digite seu nome completo',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Rua',
                          hint: 'Ex: Rua aparecida',
                          controller: streetController,
                          color: Colors.transparent,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                              Validatorless.min(
                                4,
                                'Digite sua rua',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Cidade',
                          hint: 'Ex: São paulo',
                          controller: cityController,
                          color: Colors.transparent,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                              Validatorless.min(
                                3,
                                'Digite sua Ccidade',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Número da casa',
                          hint: 'Ex: 985',
                          controller: houseNumberController,
                          color: Colors.transparent,
                          textInputType: TextInputType.number,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Bairro',
                          hint: 'Ex: Campo belo',
                          controller: districtController,
                          color: Colors.transparent,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                              Validatorless.min(
                                3,
                                'Digite seu bairro',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w
                          ),
                          child: DropdownButton<String>(
                            hint: Text(statesDropDownLabel),
                            isExpanded: true,
                            onChanged: onChanged,
                            items: Estados.listaEstadosSigla.map(
                              (String state) {
                                return DropdownMenuItem(
                                  value: state,
                                  child: Text(state),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppTextFormField(
                          label: 'Cep',
                          hint: 'Ex: 63100000',
                          color: Colors.transparent,
                          textInputType: TextInputType.number,
                          controller: cepController,
                        ),
                        SizedBox(
                          height: 1.h
                        ),
                        AppTextFormField(
                          label: 'Ponto de referência',
                          hint: 'Ex: Próximo ao posto de saúde X',
                          color: Colors.transparent,
                          controller: referencePointController,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required(
                                'Esse campo não pode ser vazio',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppButton(
                          buttonText: 'Cadastrar',
                          onPressed: signInCallBack,
                          buttonTypes: buttonTypes,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        AppButton(
                          buttonText: 'Voltar',
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(
                                  RoutesConstants.signInMainRoute),
                          buttonTypes: ButtonTypes.secondary,
                        ),
                        
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
