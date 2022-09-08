import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:validatorless/validatorless.dart';


import '../../theme/text_styles/app_text_styles.dart';
import '../app_text_form_field/app_text_form_field.dart';
import '../dialog_button/dialog_button.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import '../ratting_stars/app_ratting_stars.dart';
import 'enum/dailog_types.dart';
part './widgets/dialog_blocked.dart';
part './widgets/dialog_error.dart';
part './widgets/dialog_info.dart';
part './widgets/dialog_no_connection.dart';
part './widgets/dialog_sucess.dart';
part './widgets/dialog_vote.dart';
part './widgets/dialog_waiting.dart';
@immutable
class AppDialog extends Dialog {
  final DialogTypes dialogTypes;
  final VoidCallback? yesCallBack;
  final VoidCallback? noCallBack;
  final dynamic Function(double)? onValueChanged;
  final double value;
  final String title;
  final String message;
  final BuildContext context;
  final TextEditingController? rattingController;
  final String yesButtonMessage;
  final String noButtonMessage;
  AppDialog(
      {Key? key,
      this.dialogTypes = DialogTypes.sucess,
      this.yesCallBack,
      this.noCallBack,
      this.onValueChanged,
      this.value = 0,
      this.message = '',
      this.rattingController,
      this.yesButtonMessage = 'Sim',
      this.noButtonMessage = 'Não',
      required this.title,
      required this.context})
      : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.dp),
            child: SizedBox(
              width: Adaptive.w(90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.headLine0,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  if (dialogTypes == DialogTypes.sucess)
                    _DialogSucess().sucess(message: message)
                  else if (dialogTypes == DialogTypes.error)
                    _DialogError().error(message: message)
                  else if (dialogTypes == DialogTypes.noConnection)
                    _DialogNoConnection().noConnection(context: context)
                  else if (dialogTypes == DialogTypes.info)
                    _DialogInfo().info(
                      yesButtonMessage: yesButtonMessage,
                      noButtonMessage: noButtonMessage,
                      yesOnPressed: yesCallBack ?? () {},
                      noOnPressed: noCallBack ?? () {},
                    )
                  else if (dialogTypes == DialogTypes.waiting)
                    _DialogWaiting().waiting(
                      message: message,
                      yesOnPressed: yesCallBack ?? () {},
                      noOnpressed: noCallBack ?? (){}
                    )
                  else if (dialogTypes == DialogTypes.blocked)
                    _DialogBlocked().blocked(message: message)
                  else if (dialogTypes == DialogTypes.voteRatting)
                    _DialogVote(
                      yesCallBack: yesCallBack ?? () {},
                      noCallBack: noCallBack ?? () {},
                      onValueChanged: onValueChanged,
                      value: value,
                      rattingController: rattingController,
                    )
                ],
              ),
            ),
          ),
        );
}
