import 'package:flutter/material.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';

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
            cardTitle: 'Dúvidas frequentes',
            onPressed: () => Navigator.of(context).pushNamed(
              RoutesConstants.doubtRoute,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          InfoCard(
            cardTitle: 'Regras',
            onPressed: () => Navigator.of(context).pushNamed(RoutesConstants.rulesRoute),
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
