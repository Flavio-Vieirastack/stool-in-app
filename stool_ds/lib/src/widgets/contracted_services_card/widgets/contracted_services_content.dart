part of '../contracted_services_card.dart';

@immutable
class _ContractedServicesContent extends StatelessWidget {
  final String total;
  final String status;
  final String description;
  final String date;
  final String hour;
  final String userComent;
  final String serviceTodo;
  final String serviceProviderImageUrl;
  final String serviceProviderName;
  final bool showUserProviderData;
  final VoidCallback showUserProviderDataCallBack;
  const _ContractedServicesContent({
    Key? key,
    required this.total,
    required this.status,
    required this.description,
    required this.date,
    required this.hour,
    required this.userComent,
    required this.serviceTodo,
    required this.serviceProviderImageUrl,
    required this.serviceProviderName,
    required this.showUserProviderData,
    required this.showUserProviderDataCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.dp),
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
                        text: 'R\$ $total',
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
                        text: status,
                        style: AppTextStyles.headLine2.copyWith(
                            color: Colors.green,
                            fontSize: 20.dp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              'Descrição:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            description,
            style: AppTextStyles.headLine4,
            textAlign: TextAlign.justify,
          ),
          const Divider(
            color: AppColors.black,
          ),
          RichText(
            text: TextSpan(
              text: 'Data: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: date,
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
                  text: hour,
                  style: AppTextStyles.headLine4Gold,
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.black,
          ),
          Center(
            child: Text(
              'Comentário:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            userComent,
            style: AppTextStyles.headLine4,
            textAlign: TextAlign.justify,
          ),
          const Divider(
            color: AppColors.black,
          ),
          Center(
            child: Text(
              'Serviço a fazer:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          Text(
            serviceTodo,
            style: AppTextStyles.headLine4,
            textAlign: TextAlign.justify,
          ),
          const Divider(
            color: AppColors.black,
          ),
          Visibility(
            visible: !showUserProviderData,
            replacement: const Center(
              child: AppProgressIndicator(),
            ),
            child: Center(
              child: TextButton(
                onPressed: showUserProviderDataCallBack,
                child: const Text('Ver prestador do serviço'),
              ),
            ),
          ),
          Visibility(
            visible: showUserProviderData,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppAvatar(urlImage: serviceProviderImageUrl),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  serviceProviderName,
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
