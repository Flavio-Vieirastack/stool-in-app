import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/widgets/app_avatar/app_avatar.dart';
import 'package:stool_in_app_ui/core/widgets/contracted_services_card/contracted_services_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            AppAvatar(
              urlImage:
                  'https://super.abril.com.br/wp-content/uploads/2018/05/filhotes-de-cachorro-alcanc3a7am-o-c3a1pice-de-fofura-com-8-semanas1.png',
            )
          ],
        ),
      ),
    );
  }
}
