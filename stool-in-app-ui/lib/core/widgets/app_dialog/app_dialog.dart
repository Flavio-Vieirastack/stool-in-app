import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stool_in_app_logic/core/helpers/internet_helper/dialog_button_internet_checker.dart';
import 'package:stool_in_app_ui/core/constants/lottie_constants.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/enum/dailog_types.dart';
import 'package:stool_in_app_ui/core/widgets/app_text_form_field/app_text_form_field.dart';
import 'package:stool_in_app_ui/core/widgets/ratting_stars/app_ratting_stars.dart';
import 'package:validatorless/validatorless.dart';

import '../dialog_button/dialog_button.dart';

part './widgets/dialog_blocked.dart';
part './widgets/dialog_error.dart';
part './widgets/dialog_info.dart';
part './widgets/dialog_no_connection.dart';
part './widgets/dialog_sucess.dart';
part './widgets/dialog_vote.dart';
part './widgets/dialog_waiting.dart';

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
  AppDialog(
      {Key? key,
      this.dialogTypes = DialogTypes.sucess,
      this.yesCallBack,
      this.noCallBack,
      this.onValueChanged,
      this.value = 0,
      this.message = '',
      this.rattingController,
      required this.title,
      required this.context})
      : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.headLine0,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (dialogTypes == DialogTypes.sucess)
                  _DialogSucess().sucess(message: message)
                else if (dialogTypes == DialogTypes.error)
                  _DialogError().error(message: message)
                else if (dialogTypes == DialogTypes.noConnection)
                  _DialogNoConnection().noConnection(context: context)
                else if (dialogTypes == DialogTypes.info)
                  _DialogInfo().info(
                    yesOnPressed: yesCallBack ?? () {},
                    noOnPressed: noCallBack ?? () {},
                  )
                else if (dialogTypes == DialogTypes.waiting)
                  _DialogWaiting().waiting(message: message)
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
        );
}
