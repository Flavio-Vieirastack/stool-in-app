import 'package:flutter/material.dart';
import 'package:stool_in/core/widgets/doubt_card/doubt_card.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class DoubtPage extends StatelessWidget {
  const DoubtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixedLengthList =
        List<int>.generate(10, (int index) => index * index, growable: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dúvidas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.dp),
        child: ListView(
          children: fixedLengthList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                  child: const DoubtCard(
                    content:
                        'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    title: 'Duvida X',
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
