import 'package:flutter/material.dart';
import 'package:stool_in/core/widgets/info_expansion_card/info_expansion_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixedLengthList =
        List<int>.generate(10, (int index) => index * index, growable: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.dp),
        child: ListView(
          children: fixedLengthList
              .map(
                (e) => const InfoExpansionCard(
                  content: 'content',
                  title: 'title',
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
