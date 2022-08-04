import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_contracts.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_methos.dart';
import 'package:stool_in_app_ui/core/module/permanent_dependencies/permanent_module.dart';

@immutable
class SecureStorageModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<ReadLocalSecurityStorage>(
        create: (context) => ReadLocalSecureStorageMethodImpl(),
      ),
      Provider<ClearLocalSecurityStorage>(
        create: (context) => ClearLocalSecureStorageMethodsImpl(),
      ),
      Provider<ContainsLocalSecurityStorage>(
        create: (context) => ContainsLocalSecureStorageMethodsImpl(),
      ),
      Provider<RemoveLocalSecurityStorage>(
        create: (context) => RemoveLocalSecureStorageMethodsImpl(),
      ),
      Provider<WriteLocalSecurityStorage>(
        create: (context) => WriteLocalSecureStorageMethodsImpl(),
      ),
    ];
  }
}
