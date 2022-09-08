import 'package:flutter/material.dart';
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
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
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
          color: Colors.grey,
          borderRadius: widget.radius != null
              ? BorderRadius.all(
                  Radius.circular(widget.radius!),
                )
              : null,
        ),
      ),
    );
  }
}
