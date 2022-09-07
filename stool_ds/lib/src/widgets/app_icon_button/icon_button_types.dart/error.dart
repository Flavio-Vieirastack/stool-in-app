part of '../app_icon_button.dart';

class _Error extends StatelessWidget {
  final VoidCallback onPressed;
  const _Error({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.close,
        color: Colors.red,
        size: 30.dp,
      ),
    );
  }
}
