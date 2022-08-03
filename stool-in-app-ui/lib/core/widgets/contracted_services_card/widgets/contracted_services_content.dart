part of '../contracted_services_card.dart';

class _ContractedServicesContent extends StatelessWidget {
  const _ContractedServicesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: RichText(
              text: TextSpan(
                text: 'Total: ',
                style: AppTextStyles.headLine2,
                children: <TextSpan>[
                  TextSpan(
                    text: 'R\$ 255',
                    style: AppTextStyles.headLine1Gold,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'Descrição:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: AppTextStyles.headLine4,
          ),
          Divider(
            color: AppColors.black,
          ),
          RichText(
            text: TextSpan(
              text: 'Data: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: '05/07/2022',
                  style: AppTextStyles.headLine4Gold,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Hora: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: '17:00',
                  style: AppTextStyles.headLine4Gold,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.black,
          ),
          Center(
            child: Text(
              'Comentário:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: AppTextStyles.headLine4,
          ),
          Divider(
            color: AppColors.black,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                text: 'Status: ',
                style: AppTextStyles.headLine2,
                children: <TextSpan>[
                  TextSpan(
                    text: 'ATIVO',
                    style: AppTextStyles.headLine2.copyWith(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
