import 'package:flutter/material.dart';
import 'package:stool_in/core/widgets/doubt_card/doubt_card.dart';

class DoubtPage extends StatelessWidget {
  const DoubtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dúvidas'),
      ),
      body: Column(
        children: const [
          DoubtCard(),
        ],
      ),
    );
  }
}
