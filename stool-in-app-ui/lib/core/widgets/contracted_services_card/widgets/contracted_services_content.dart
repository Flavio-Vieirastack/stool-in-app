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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
            textAlign: TextAlign.justify,
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
            textAlign: TextAlign.justify,
          ),
          Divider(
            color: AppColors.black,
          ),
          Center(
            child: Text(
              'Serviço a fazer:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: AppTextStyles.headLine4,
            textAlign: TextAlign.justify,
          ),
          Divider(
            color: AppColors.black,
          ),
          Visibility(
            visible: true,
            replacement: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Prestador do serviço'),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
                  ),
                ),
                const SizedBox(
                   width: 10,
                ),
                Text(
                  'User Name',
                  style: AppTextStyles.headLine1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
