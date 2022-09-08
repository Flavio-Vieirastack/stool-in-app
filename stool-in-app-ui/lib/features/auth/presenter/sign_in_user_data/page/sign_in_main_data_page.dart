
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
part './widgets/sign_in_data_card.dart';
@immutable
class SignInMainDataPage extends StatefulWidget {
  const SignInMainDataPage({Key? key}) : super(key: key);

  @override
  State<SignInMainDataPage> createState() => _SignInMainDataPageState();
}
class _SignInMainDataPageState extends State<SignInMainDataPage>
    with AppSnackBar {
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
    final firebaseStorageCubit = context.read<FirebaseStorageCubit>();
    String stateInitialName = 'Estado';
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.12),
      resizeToAvoidBottomInset: false,
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignInUserDataCubit, SignInUserDataState>(
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
              } else if (state is SignInDropDownChanged) {
                stateInitialName = state.userSelectedState ?? 'Estado';
              }
            },
          ),
          BlocListener<FirebaseStorageCubit, FirebaseStorageState>(
            listener: (context, state) {
              if (state is FirebaseStorageError) {
                showAppSnackbar(
                  message:
                      'Ops! Ocorreu um erro ao salvar sua foto, escolha outra ou tente mais tarde.',
                  type: SnackBarType.error,
                  context: context,
                );
              } else if (state is FirebaseStorageSucess) {
                showAppSnackbar(
                  message: 'Sua imagem foi salva com sucesso!',
                  context: context,
                );
              }
            },
          ),
        ],
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                'Para finalizar,',
                style: AppTextStyles.headLine0,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Stack(
              children: [
                BlocBuilder<SignInUserDataCubit, SignInUserDataState>(
                  builder: (context, state) {
                    if (state is SignInUserDataLoading) {
                      return IgnorePointer(
                        ignoring: true,
                        child: Center(
                          child: _SignInDataCard(
                            formKey: formKey,
                            statesDropDownLabel: stateInitialName,
                            onChanged: (value) =>
                                cubit.changeStateDropDown(value: value),
                            buttonTypes: ButtonTypes.loading,
                            cepController: cepController,
                            cityController: cityController,
                            districtController: districtController,
                            houseNumberController: houseNumberController,
                            referencePointController: referencePointController,
                            streetController: streetController,
                            userNameController: userNameController,
                            signInCallBack: () {},
                          ),
                        ),
                      );
                    } else if (state is SignInUserDataSucess) {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          urlImage: state.userUrlImage,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
                              referencePoint:
                                  referencePointController.text.trim(),
                              street: streetController.text.trim(),
                              userName: userNameController.text.trim(),
                              userState: stateInitialName,
                            ),
                          ),
                        ),
                      );
                    } else if (state is SignInUserDataLoginApiSucess) {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          urlImage: state.userUrlImage,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
                              referencePoint:
                                  referencePointController.text.trim(),
                              street: streetController.text.trim(),
                              userName: userNameController.text.trim(),
                              userState: stateInitialName,
                            ),
                          ),
                        ),
                      );
                    } else if (state is SignInUserDataLoginFirebaseSucess) {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          urlImage: state.userUrlImage,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
                              referencePoint:
                                  referencePointController.text.trim(),
                              street: streetController.text.trim(),
                              userName: userNameController.text.trim(),
                              userState: stateInitialName,
                            ),
                          ),
                        ),
                      );
                    } else if (state is SignInUserDataLoading) {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          ignoring: true,
                          urlImage: state.userUrlImage,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
                              referencePoint:
                                  referencePointController.text.trim(),
                              street: streetController.text.trim(),
                              userName: userNameController.text.trim(),
                              userState: stateInitialName,
                            ),
                          ),
                        ),
                      );
                    } else if (state is SignInUserDataInitial) {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
                              referencePoint:
                                  referencePointController.text.trim(),
                              street: streetController.text.trim(),
                              userName: userNameController.text.trim(),
                              userState: stateInitialName,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: _SignInDataCard(
                          formKey: formKey,
                          statesDropDownLabel: stateInitialName,
                          onChanged: (value) =>
                              cubit.changeStateDropDown(value: value),
                          cepController: cepController,
                          cityController: cityController,
                          districtController: districtController,
                          houseNumberController: houseNumberController,
                          referencePointController: referencePointController,
                          streetController: streetController,
                          userNameController: userNameController,
                          signInCallBack: () => cubit.sendUserDataToApi(
                            validate: formKey.currentState?.validate() ?? false,
                            userState: stateInitialName,
                            userDataEntity: UserDataEntity(
                              cep: cepController.text.trim(),
                              city: cityController.text.trim(),
                              district: districtController.text.trim(),
                              houseNumber: houseNumberController.text.trim(),
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
                  padding: EdgeInsets.only(top: 10.w, left: 55.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonLeftGradientColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.dp),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () async =>
                          firebaseStorageCubit.pickAndUploadImage(
                        imageFrom: ImageFrom.gallery,
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.dp,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                   height: 200.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
