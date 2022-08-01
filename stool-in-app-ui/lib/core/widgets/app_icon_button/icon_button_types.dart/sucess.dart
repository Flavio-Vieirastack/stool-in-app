part of '../app_icon_button.dart';

class _Sucess extends StatelessWidget {
  final VoidCallback onPressed;
  const _Sucess({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
        size: 30,
      ),
    );
  }
}
