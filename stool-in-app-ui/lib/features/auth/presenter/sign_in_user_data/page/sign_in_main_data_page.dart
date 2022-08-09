import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/constants/routes_constants.dart';
import 'package:stool_in_app_ui/core/helpers/responsive/responsive_helper_mixin.dart';
import 'package:stool_in_app_ui/core/widgets/app_snackbar/app_snackbar.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/auth/presenter/sign_in_user_data/cubit/sign_in_user_data_cubit.dart';

import '../../../../../core/helpers/theme/colors/app_colors.dart';
import '../../../../../core/helpers/theme/text_styles/app_text_styles.dart';
import '../../../../../core/widgets/app_avatar/app_avatar.dart';
import '../../../../../core/widgets/app_button/app_button.dart';
import '../../../../../core/widgets/app_button/enum/button_types.dart';
import '../../../../../core/widgets/app_text_form_field/app_text_form_field.dart';
part './widgets/sign_in_data_card.dart';

class SignInMainDataPage extends StatefulWidget {
  const SignInMainDataPage({Key? key}) : super(key: key);

  @override
  State<SignInMainDataPage> createState() => _SignInMainDataPageState();
}

class _SignInMainDataPageState extends State<SignInMainDataPage>
    with ResponsiveHelperMixin, AppSnackBar {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController referencePointController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    streetController.dispose();
    cityController.dispose();
    houseNumberController.dispose();
    districtController.dispose();
    cepController.dispose();
    referencePointController.dispose();
    formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInUserDataCubit>();
    String stateInitialName = 'Estado';
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignInUserDataCubit, SignInUserDataState>(
        listener: (context, state) {
          if (state is SignInUserDataStateNotSelected) {
            showAppSnackbar(
              message: 'Selecione o seu estado',
              type: SnackBarType.error,
              context: context,
            );
          } else if (state is SignInUserDataError) {
            showAppSnackbar(
              message: state.message,
              type: SnackBarType.error,
              context: context,
            );
          } else if (state is SignInUserDataSucess) {
            Navigator.of(context)
                .pushReplacementNamed(RoutesConstants.homeRoute);
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Para finalizar,',
                    style: AppTextStyles.headLine0,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: constraints.maxHeight,
                  child: Stack(
                    children: [
                      BlocBuilder<SignInUserDataCubit, SignInUserDataState>(
                        builder: (context, state) {
                          if (state is SignInUserDataLoading) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth *
                                    responsiveWidth(
                                      defaultMobileWidth: 0.03,
                                      defaultMobileSmallSizeWidth: 0.01,
                                      defaultTabletWidth: 0.01,
                                      constraints: constraints,
                                    ),
                              ),
                              child: IgnorePointer(
                                ignoring: true,
                                child: _SignInDataCard(
                                  formKey: formKey,
                                  statesDropDownLabel: stateInitialName,
                                  onChanged: (value) {},
                                  buttonTypes: ButtonTypes.loading,
                                  cepController: cepController,
                                  cityController: cityController,
                                  districtController: districtController,
                                  houseNumberController: houseNumberController,
                                  referencePointController:
                                      referencePointController,
                                  streetController: streetController,
                                  userNameController: userNameController,
                                  signInCallBack: () {},
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth *
                                    responsiveWidth(
                                      defaultMobileWidth: 0.03,
                                      defaultMobileSmallSizeWidth: 0.01,
                                      defaultTabletWidth: 0.01,
                                      constraints: constraints,
                                    ),
                              ),
                              child: _SignInDataCard(
                                formKey: formKey,
                                statesDropDownLabel: stateInitialName,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      stateInitialName = value;
                                    });
                                  }
                                },
                                cepController: cepController,
                                cityController: cityController,
                                districtController: districtController,
                                houseNumberController: houseNumberController,
                                referencePointController:
                                    referencePointController,
                                streetController: streetController,
                                userNameController: userNameController,
                                signInCallBack: () => cubit.sendUserDataToApi(
                                  formKey: formKey,
                                  userState: stateInitialName,
                                  userDataEntity: UserDataEntity(
                                    cep: cepController.text.trim(),
                                    city: cityController.text.trim(),
                                    district: districtController.text.trim(),
                                    houseNumber:
                                        houseNumberController.text.trim(),
                                    referencePoint:
                                        referencePointController.text.trim(),
                                    street: streetController.text.trim(),
                                    userName: userNameController.text.trim(),
                                    userState: stateInitialName,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: constraints.maxHeight *
                              responsiveHeight(
                                defaultMobileHeight: 0.06,
                                defaultMobileSmallSizeHeight: 0.5,
                                defaultTabletHeight: 0.5,
                                constraints: constraints,
                              ),
                          left: constraints.maxWidth *
                              responsiveWidth(
                                defaultMobileWidth: 0.53,
                                defaultMobileSmallSizeWidth: 0.5,
                                defaultTabletWidth: 0.5,
                                constraints: constraints,
                              ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonLeftGradientColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
