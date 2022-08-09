import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_app_ui/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';

import '../../../../../core/constants/keys_constants.dart';

part 'sign_in_user_data_state.dart';

class SignInUserDataCubit extends Cubit<SignInUserDataState>
    with SharedPreferencesHelper {
  final AuthUseCase _authUseCase;
  final ReadLocalSecurityStorage _readLocalSecurityStorage;
  final WriteLocalSecurityStorage _writeLocalSecurityStorage;
  final FirebaseAuth _firebaseAuth;
  final FireBaseNotifications _fireBaseNotifications;
  SignInUserDataCubit({
    required AuthUseCase authUseCase,
    required ReadLocalSecurityStorage readLocalSecurityStorage,
    required WriteLocalSecurityStorage writeLocalSecurityStorage,
    required FirebaseAuth firebaseAuth,
    required FireBaseNotifications fireBaseNotifications,
  })  : _authUseCase = authUseCase,
        _writeLocalSecurityStorage = writeLocalSecurityStorage,
        _fireBaseNotifications = fireBaseNotifications,
        _firebaseAuth = firebaseAuth,
        _readLocalSecurityStorage = readLocalSecurityStorage,
        super(SignInUserDataInitial());
  Future<void> sendUserDataToApi({
    required UserDataEntity userDataEntity,
    required bool validate,
    required String userState,
  }) async {
    if (validate) {
      if (userState != 'Estado') {
        emit(SignInUserDataLoading());
        final userFirebaseToken = _firebaseAuth.currentUser?.uid;
        final userFirebasePushToken =
            await _fireBaseNotifications.getTokenFirebase();
        final result = await _authUseCase.sendUserData(
          userDataEntity: UserDataEntity(
            cep: userDataEntity.cep,
            city: userDataEntity.city,
            district: userDataEntity.district,
            houseNumber: userDataEntity.houseNumber,
            referencePoint: userDataEntity.referencePoint,
            street: userDataEntity.street,
            userFirebasePushToken: userFirebasePushToken,
            userFirebaseUuid: userFirebaseToken,
            userLocationLatitude: 5, //TODO
            userLocationLongitude: 6, //TODO,
            userName: userDataEntity.userName,
            userPhotoUrl: '', //TODO
            userState: userDataEntity.userState,
          ),
        );
        result.fold(
          (error) => emit(
            SignInUserDataError(message: error.message),
          ),
          (sucess) async {
            saveBool(key: KeysConstants.userPassByDataPage, value: true);
            saveString(
                key: KeysConstants.userName, value: sucess.userName ?? '');
            saveDouble(
              key: KeysConstants.userLocationLatitude,
              value: sucess.userLocationLatitude ?? 0.0,
            );
            saveDouble(
              key: KeysConstants.userLocationaLogintude,
              value: sucess.userLocationLongitude ?? 0.0,
            );
            saveString(
                key: KeysConstants.userPhotoUrl,
                value: sucess.userPhotoUrl ?? '');
            await _loginInToApi();
            final loginApiSucess =
                await getBool(key: KeysConstants.userPassLoginToApi);
            final loginFirebaseSucess =
                await getBool(key: KeysConstants.userPassLoginToFirebase);
            if (loginApiSucess! && loginFirebaseSucess!) {
              emit(SignInUserDataSucess());
            }
          },
        );
      } else {
        emit(SignInUserDataStateNotSelected());
      }
    }
  }

  Future<void> _loginInToApi() async {
    final userEmail =
        await _readLocalSecurityStorage.read(key: KeysConstants.userEmail);
    final userPassword =
        await _readLocalSecurityStorage.read(key: KeysConstants.userPassword);
    final userFirebaseToken = await _readLocalSecurityStorage.read(
        key: KeysConstants.userFirebaseToken);
    final result = await _authUseCase.apiLogin(
      authEntity: AuthEntity(
        email: userEmail ?? '',
        password: userPassword,
        firebaseUuid: userFirebaseToken,
      ),
    );
    result.fold(
      (error) {
        saveBool(key: KeysConstants.userPassLoginToApi, value: false);
        emit(
          SignInUserDataError(message: error.message),
        );
      },
      (sucess) async {
        await _writeLocalSecurityStorage.write(
          key: KeysConstants.userToken,
          value: sucess.token,
        );
        saveBool(key: KeysConstants.userPassLoginToApi, value: true);
        await _loginInToFirebase();
        emit(SignInUserDataLoginApiSucess());
      },
    );
  }

  Future<void> _loginInToFirebase() async {
    final userEmail =
        await _readLocalSecurityStorage.read(key: KeysConstants.userEmail);
    final userPassword =
        await _readLocalSecurityStorage.read(key: KeysConstants.userPassword);

    final result = await _authUseCase.firebaseLogin(
      authEntity: AuthEntity(
        email: userEmail ?? '',
        password: userPassword ?? '',
      ),
    );
    result.fold(
      (error) {
        emit(SignInUserDataError(message: error.message));
        saveBool(key: KeysConstants.userPassLoginToFirebase, value: false);
      },
      (sucess) {
        saveBool(key: KeysConstants.userPassLoginToFirebase, value: true);
        emit(
          SignInUserDataLoginFirebaseSucess(),
        );
      },
    );
  }
}
