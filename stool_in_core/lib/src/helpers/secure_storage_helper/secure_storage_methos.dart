import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stool_in_core/src/helpers/secure_storage_helper/secure_storage_contracts.dart';




FlutterSecureStorage get _instance => const FlutterSecureStorage();

//const options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class ReadLocalSecureStorageMethodImpl implements ReadLocalSecurityStorage {
  @override
  Future<String?> read({required String key}) => _instance.read(
        key: key,
        //iOptions: options,
        aOptions: _getAndroidOptions(),
      );
}

class ClearLocalSecureStorageMethodsImpl implements ClearLocalSecurityStorage {
  @override
  Future<bool> clearAll() async {
    try {
      _instance.deleteAll(
        //iOptions: options,
        aOptions: _getAndroidOptions(),
      );
      return true;
    } catch (e, s) {
      log('Erro ao deletar todos os dados', error: e, stackTrace: s);
      return false;
    }
  }
}

class ContainsLocalSecureStorageMethodsImpl
    implements ContainsLocalSecurityStorage {
  @override
  Future<bool> contains({required String key}) async {
    try {
      _instance.containsKey(key: key);
      return true;
    } catch (e, s) {
      log('Erro ao verificar se existe um valor', error: e, stackTrace: s);
      return false;
    }
  }
}

class RemoveLocalSecureStorageMethodsImpl
    implements RemoveLocalSecurityStorage {
  @override
  Future<bool> delete({required String key}) async {
    try {
      _instance.delete(
        key: key,
        //iOptions: options,
        aOptions: _getAndroidOptions(),
      );
      return true;
    } catch (e, s) {
      log('Erro ao deletar o valor', error: e, stackTrace: s);
      return false;
    }
  }
}

class WriteLocalSecureStorageMethodsImpl implements WriteLocalSecurityStorage {
  @override
  Future<void> write({required String key, required String value}) =>
      _instance.write(
        key: key,
        value: value,
        //iOptions: options,
        aOptions: _getAndroidOptions(),
      );
}