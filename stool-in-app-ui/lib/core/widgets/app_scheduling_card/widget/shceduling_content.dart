import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_app_ui/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in_app_ui/core/widgets/dialog_button/dialog_button.dart';

import '../../../helpers/theme/text_styles/app_text_styles.dart';

class ShcedulingContent extends StatelessWidget {
  const ShcedulingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: AutoSizeText(
                  'userName userName userName userName userName',
                  style: AppTextStyles.headLine1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  maxFontSize: 18,
                  minFontSize: 17,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '05/07/2022 as 14:00',
                style: AppTextStyles.headLine4Gold,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Total: 255 R\$',
              style: AppTextStyles.headLine1Gold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Descrição:',
            style: AppTextStyles.headLine4Gold,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: AppTextStyles.headLine4,
          ),
          Divider(
            color: AppColors.black,
          ),
          Text(
            'Comentário:',
            style: AppTextStyles.headLine4Gold,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: AppTextStyles.headLine4,
          ),
          Divider(
            color: AppColors.black,
          ),
          Text(
            'Serviços a fazer:',
            style: AppTextStyles.headLine4Gold,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: AppTextStyles.headLine4,
          ),
          Divider(
            color: AppColors.black,
          ),
          Text(
            'Endereço:',
            style: AppTextStyles.headLine4Gold,
          ),
          RichText(
            text: TextSpan(
              text: 'Rua: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: 'Rua x',
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Cidade: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: 'Cidade x',
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Número: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: '255',
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Bairro: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: 'Bairro x',
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Ponto de referência: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: 'Ponto x',
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: DialogButton(
              onPressed: () {},
              dialogButtonType: DialogButtonType.no,
              buttonText: 'Cancelar',
            ),
          ),
        ],
      ),
    );
  }
}
