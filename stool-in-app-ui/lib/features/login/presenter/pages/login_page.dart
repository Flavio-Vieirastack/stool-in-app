import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_button/app_button.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/app_dialog.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/enum/dailog_types.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          AppButton(
            buttonText: 'dialog',
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AppDialog(dailogTypes: DialogTypes.noConnection,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
