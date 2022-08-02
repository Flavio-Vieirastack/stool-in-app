import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/text_styles/app_text_styles.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/enum/dailog_types.dart';
import 'package:stool_in_app_ui/core/widgets/app_dialog/widgets/dialog_sucess.dart';

class AppDialog extends Dialog {
  final DailogTypes dailogTypes;
  AppDialog({
    Key? key,
    this.dailogTypes = DailogTypes.sucess,
  }) : super(
          key: key,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              child: Column(
                children: [
                  Text(
                    'Título',
                    style: AppTextStyles.headLine0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if(dailogTypes == DailogTypes.sucess)
                  DialogSucess().sucess(message: 'Mensagem')
                ],
              ),
            ),
          ),
        );
}
