import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stool_in/core/constants/keys_constants.dart';
import 'package:stool_in/core/helpers/pick_image_helper/pick_image_helper.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/core/helpers/storage_ref/user_storage_ref.dart';

part 'firebase_storage_state.dart';

class FirebaseStorageCubit extends Cubit<FirebaseStorageState>
    with SharedPreferencesHelper {
  final FirebaseStorage _firebaseStorage;
  final PickImageHelper _pickImageHelper;
  final UserStorageRef _userStorageRef;
  FirebaseStorageCubit({
    required FirebaseStorage firebaseStorage,
    required PickImageHelper pickImageHelper,
    required UserStorageRef userStorageRef,
  })  : _firebaseStorage = firebaseStorage,
        _userStorageRef = userStorageRef,
        _pickImageHelper = pickImageHelper,
        super(FirebaseStorageInitial());
  Future<void> _uploadImage({
    required String path,
  }) async {
    emit(FirebaseStorageLoading());
    File file = File(path);
    try {
      String ref = await _userStorageRef.getRef();
      final result =
          await _firebaseStorage.ref(ref).putFile(file);
      final urlImage = await result.ref.getDownloadURL();
      log(urlImage);
      saveString(key: KeysConstants.userPhotoUrl, value: urlImage);
      emit(FirebaseStorageSucess(userUrlImage: urlImage));
    } catch (e, s) {
      log('Erro ao fazer upload para o firebase', error: e, stackTrace: s);
      emit(FirebaseStorageError());
    }
  }

  Future<void> pickAndUploadImage({required ImageFrom imageFrom}) async {
    XFile? file = await _pickImageHelper.getImage(imageFrom: imageFrom);
    if (file != null) {
      await _uploadImage(path: file.path);
    }
  }
}
