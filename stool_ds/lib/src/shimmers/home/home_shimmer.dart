import 'package:flutter/material.dart';
import 'package:stool_ds/stool_ds.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ShimmerWidget(
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
