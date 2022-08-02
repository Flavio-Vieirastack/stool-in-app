part of '../app_dialog.dart';

class _DialogVote extends StatefulWidget {
  final VoidCallback yesCallBack;
  final VoidCallback noCallBack;
  const _DialogVote({
    Key? key,
    required this.noCallBack,
    required this.yesCallBack,
  }) : super(key: key);

  @override
  State<_DialogVote> createState() => _DialogVoteState();
}

class _DialogVoteState extends State<_DialogVote> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppRattingStars(
            value: value,
            onValueChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            DialogButton(
              onPressed: widget.yesCallBack,
              dialogButtonType: DialogButtonType.yes,
              buttonText: 'Votar',
            ),
            DialogButton(
              onPressed: widget.noCallBack,
              dialogButtonType: DialogButtonType.no,
              buttonText: 'Cancelar',
            ),
          ],
        )
      ],
    );
  }
}
