import 'package:flutter/material.dart';
import 'package:stool_in/core/constants/routes_constants.dart';
import 'package:stool_in/core/widgets/info_card/info_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          InfoCard(
            cardTitle: 'Dúvidas',
            onPressed: () => Navigator.of(context).pushNamed(
              RoutesConstants.doubtRoute,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InfoCard(
            cardTitle: 'Regras',
            onPressed: () {},
          ),
          SizedBox(
            height: 2.h,
          ),
          InfoCard(
            cardTitle: 'Informações',
            onPressed: () {},
          ),
          SizedBox(
            height: 2.h,
          ),
          InfoCard(
            cardTitle: 'Sobre',
            onPressed: () {},
            cardIconColor: Colors.blue,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
