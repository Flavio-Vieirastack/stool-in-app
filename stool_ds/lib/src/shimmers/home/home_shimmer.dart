import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shimmerWidget = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShimmerWidget(
        height: 25.h,
        width: 18.h,
      ),
    );
    final sizedBox = SizedBox(
      height: 2.h,
    );
    return Scaffold(
      body: IgnorePointer(
        ignoring: true,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.dp),
              child: Column(
                children: [
                  Row(
                    children: [
                      ShimmerWidget(
                        height: 6.h,
                        width: 6.h,
                        radius: 50.dp,
                      ),
                      sizedBox,
                      ShimmerWidget(
                        height: 3.h,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      ShimmerWidget(
                        height: 3.h,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      ShimmerWidget(
                        height: 4.h,
                        width: 4.h,
                        radius: 50.dp,
                      ),
                    ],
                  ),
                  sizedBox,
                  Center(
                    child: ShimmerWidget(
                      height: 5.h,
                      width: Adaptive.w(90),
                    ),
                  ),
                  sizedBox,
                  Center(
                    child: ShimmerWidget(
                      height: 5.h,
                      radius: 20.dp,
                      width: Adaptive.w(90),
                    ),
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerWidget(
                        height: 3.h,
                        width: 30.w,
                      ),
                      ShimmerWidget(
                        height: 3.h,
                        width: 25.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        shimmerWidget,
                        shimmerWidget,
                        shimmerWidget,
                      ],
                    ),
                  ),
                  sizedBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ShimmerWidget(
                      height: 4.h,
                      width: 40.w,
                    ),
                  ),
                  sizedBox,
                  ShimmerWidget(
                    height: 20.h,
                    width: Adaptive.w(90),
                  ),
                  sizedBox,
                  ShimmerWidget(
                    height: 20.h,
                    width: Adaptive.w(90),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
