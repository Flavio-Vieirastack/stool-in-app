import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_coments_cards/app_coments_cards.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: const [
           SizedBox(
             height: 20,
          ),
          AppComentsCards()
        ],
      ),
    );
  }
}
