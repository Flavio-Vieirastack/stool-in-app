import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shimmerWidget = ShimmerWidget(
      height: 4.h,
      width: 2.h,
    );
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(18.0.dp),
            child: Column(
              children: [
                Row(
                  children: [
                    ShimmerWidget(
                      height: 2.h,
                      width: 2.h,
                      radius: 50.dp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    ShimmerWidget(
                      height: 2.h,
                      width: 4.h,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    ShimmerWidget(
                      height: 2.h,
                      width: 4.h,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    ShimmerWidget(
                      height: 2.h,
                      width: 2.h,
                      radius: 50.dp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ShimmerWidget(
                    height: 2.h,
                    radius: 20.dp,
                    width: Adaptive.w(90),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: ShimmerWidget(
                    height: 2.h,
                    radius: 20.dp,
                    width: Adaptive.w(90),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(
                      height: 1.h,
                      width: 1.w,
                    ),
                    ShimmerWidget(
                      height: 1.h,
                      width: 1.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    shimmerWidget,
                    shimmerWidget,
                    shimmerWidget,
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                ShimmerWidget(
                  height: 1.h,
                  width: 2.w,
                ),
                SizedBox(
                  height: 1.h,
                ),
                ShimmerWidget(
                  height: 5.h,
                  width: Adaptive.w(90),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ShimmerWidget(
                  height: 5.h,
                  width: Adaptive.w(90),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
