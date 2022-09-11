import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with SharedPreferencesHelper {
  final GetServiceProviderUsecase _serviceProviderUsecase;
  final CategoriesUsecase _categoriesUsecase;
  final UserDataUniqueUsecase _userDataUniqueUsecase;
  final GeoLocatorCubit _geoLocatorCubit;
  final FireBaseNotifications _fireBaseNotifications;
  final UserUniqueUsecase _uniqueUsecase;
  final ServiceProviderSortListHelper _serviceProviderSortListHelper;
  late final UserUniqueEntity userUniqueEntity;
  late final List<CategoriesEntity> categories;
  HomeCubit({
    required GetServiceProviderUsecase serviceProviderUsecase,
    required CategoriesUsecase categoriesUsecase,
    required UserDataUniqueUsecase userDataUniqueUsecase,
    required GeoLocatorCubit geoLocatorCubit,
    required ServiceProviderSortListHelper serviceProviderSortListHelper,
    required FireBaseNotifications fireBaseNotifications,
    required UserUniqueUsecase userUniqueUsecase,
  })  : _serviceProviderUsecase = serviceProviderUsecase,
        _geoLocatorCubit = geoLocatorCubit,
        _fireBaseNotifications = fireBaseNotifications,
        _uniqueUsecase = userUniqueUsecase,
        _serviceProviderSortListHelper = serviceProviderSortListHelper,
        _userDataUniqueUsecase = userDataUniqueUsecase,
        _categoriesUsecase = categoriesUsecase,
        super(HomeInitial());

  Future<void> getAllHomeData({required int pageQuantity}) async {
    emit(HomeLoading());
    final userLatitude =
        await getDouble(key: KeysConstants.userLocationLatitude);
    final userlongitude =
        await getDouble(key: KeysConstants.userLocationaLogintude);
    final userName = await getString(key: KeysConstants.userName);
    final userImage = await getString(key: KeysConstants.userPhotoUrl);
    final result = await _serviceProviderUsecase.call(
      providersParams: GetServiceProvidersParams(
        pageQuantity: pageQuantity,
        currentUserLocationLatitude: userLatitude ?? 0.0,
        currentUserLocationLongitude: userlongitude ?? 0.0,
      ),
    );
    result.fold(
      (error) => emit(
        HomeError(message: error.message),
      ),
      (sucess) async {
        await _getMenuItens();
        await _getUserUniqueData();
        emit(
          HomeSucess(
              serviceProvider:
                  _serviceProviderSortListHelper.sortByVotes(providers: sucess),
              userName: userName ?? '',
              userImage: userImage,
              categories: categories,
              userUniqueEntity: userUniqueEntity),
        );
      },
    );
  }

  Future<void> _getUserUniqueData() async {
    emit(HomeLoading());
    final data = await _uniqueUsecase.call();
    data.fold(
      (error) => emit(HomeError(message: error.error)),
      (sucess) {
        userUniqueEntity = sucess;
      },
    );
  }

  Future<void> _getMenuItens() async {
    emit(HomeLoading());
    final result = await _categoriesUsecase.call();
    await _userDataVerifyAndUpdate();
    result.fold(
      (error) => emit(
        HomeError(
          message: error.message,
        ),
      ),
      (sucess) {
        categories = sucess;
      },
    );
  }

  Future<void> _userDataVerifyAndUpdate() async {
    await _updateUserLocation();
    await _updateUserNameAndPhotoUrl();
    await _updateUserPushToken();
    await _verifyUserDataIsNull();
  }

  Future<void> _updateUserLocation() async {
    emit(HomeLoading());
    final currentPosition = await _geoLocatorCubit.getCurrentPosition();
    await _geoLocatorCubit.requestUserPermition();
    final userLatitude =
        await getDouble(key: KeysConstants.userLocationLatitude);
    final userLongitude =
        await getDouble(key: KeysConstants.userLocationaLogintude);
    if (userLatitude == null ||
        userLatitude != currentPosition.latitude ||
        userLongitude == null ||
        userLongitude != currentPosition.longitude) {
      log('Update userLocation');
      await saveDouble(
        key: KeysConstants.userLocationLatitude,
        value: currentPosition.latitude,
      );
      await saveDouble(
        key: KeysConstants.userLocationaLogintude,
        value: currentPosition.longitude,
      );
      final result = await _userDataUniqueUsecase.updateUserData(
        userDataEntity: UserDataEntity(
          userLocationLatitude: currentPosition.latitude,
          userLocationLongitude: currentPosition.longitude,
        ),
      );
      result.fold(
        (erro) => emit(HomeError(message: erro.message)),
        (sucess) => null,
      );
    }
  }

  Future<void> _updateUserPushToken() async {
    emit(HomeLoading());
    await _fireBaseNotifications.refreshTokenFirebase(
      updateToken: (token) async => _userDataUniqueUsecase.updateUserData(
        userDataEntity: UserDataEntity(
          userFirebasePushToken: token,
        ),
      ),
    );
  }

  Future<void> _updateUserNameAndPhotoUrl() async {
    emit(HomeLoading());
    final userName = await getString(key: KeysConstants.userName);
    if (userName == null) {
      final latitude = await getDouble(key: KeysConstants.userLocationLatitude);
      final longitude =
          await getDouble(key: KeysConstants.userLocationaLogintude);
      final result = await _userDataUniqueUsecase.getUserDataUnique(
        userDataUniqueLocation: UserDataUniqueLocation(
          latitude: latitude!,
          longitude: longitude!,
        ),
      );
      result.fold(
        (error) => emit(
          HomeError(
            message: error.message,
          ),
        ),
        (sucess) async {
          if (sucess.userName != null) {
            await saveString(
              key: KeysConstants.userName,
              value: sucess.userName ?? '',
            );
            await saveString(
              key: KeysConstants.userPhotoUrl,
              value: sucess.userPhotoUrl ?? '',
            );
            log('UserName and photo url updated');
          }
        },
      );
    }
  }

  Future<void> _verifyUserDataIsNull() async {
    emit(HomeLoading());
    final currentPosition = await _geoLocatorCubit.getCurrentPosition();
    final result = await _userDataUniqueUsecase.getUserDataUnique(
      userDataUniqueLocation: UserDataUniqueLocation(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      ),
    );
    result.fold(
      (error) => emit(
        HomeError(
          message: error.message,
        ),
      ),
      (sucess) async {
        if (sucess.city?.isEmpty ?? false) {
          log('Must add user data');
          noDataState();
          await delay();
          goToDataPageState();
        }
      },
    );
  }

  void goToDataPageState() => emit(
        HomeStateGoToDataPage(),
      );

  void noDataState() => emit(
        HomeStateNoData(),
      );

  Future<dynamic> delay() => Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
}
