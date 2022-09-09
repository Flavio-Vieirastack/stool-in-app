import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';

@immutable
class ShimmerWidget extends StatefulWidget {
  final double height;
  final double width;
  final double? radius;
  const ShimmerWidget({
    Key? key,
    required this.height,
    required this.width,
    this.radius,
  }) : super(key: key);

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: widget.radius != null
              ? BorderRadius.all(
                  Radius.circular(widget.radius!),
                )
              :  BorderRadius.all(
                  Radius.circular(20.dp),
                ),
        ),
      ),
    );
  }
}
