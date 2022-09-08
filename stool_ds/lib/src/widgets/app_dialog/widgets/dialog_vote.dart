part of '../app_dialog.dart';
@immutable
class _DialogVote extends StatefulWidget {
  final VoidCallback yesCallBack;
  final VoidCallback noCallBack;
  final TextEditingController? rattingController;
  final dynamic Function(double)? onValueChanged;
  final double value;
  const _DialogVote({
    Key? key,
    required this.noCallBack,
    required this.yesCallBack,
    required this.onValueChanged,
    required this.value,
    this.rattingController,
  }) : super(key: key);

  @override
  State<_DialogVote> createState() => _DialogVoteState();
}

class _DialogVoteState extends State<_DialogVote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppRattingStars(
            value: widget.value,
            onValueChanged: widget.onValueChanged,
          ),
        ),
         SizedBox(
          height: 3.h,
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: 10.h,
            minWidth: 200.w,
            maxWidth: 300.w,
          ),
          child: AppTextFormField(
            expands: true,
            hint: 'Ex: Profissional de qualidade, serviço excelente.',
            label: 'Comentário',
            controller: widget.rattingController,
            validator: Validatorless.multiple(
              [
                Validatorless.required(
                  'Esse campo não pode ficar vazio',
                ),
              ],
            ),
          ),
        ),
         SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
