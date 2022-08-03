part of '../app_scheduling_card.dart';

class _ShcedulingContent extends StatelessWidget {
  final String userUrlImage;
  final String userName;
  final String jobDate;
  final String jobHour;
  final String totalPrice;
  final String serviceDescription;
  final String userComentary;
  final bool userComentaryVisible;
  final String servicesTodo;
  final String street;
  final String city;
  final String houseNumber;
  final String district;
  final String referencePoint;
  final VoidCallback cancelOnPressed;

  const _ShcedulingContent({
    Key? key,
    required this.userUrlImage,
    required this.userName,
    required this.jobDate,
    required this.jobHour,
    required this.totalPrice,
    required this.serviceDescription,
    required this.userComentary,
    required this.userComentaryVisible,
    required this.servicesTodo,
    required this.street,
    required this.city,
    required this.houseNumber,
    required this.district,
    required this.referencePoint,
    required this.cancelOnPressed,
  }) : super(key: key);

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
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userUrlImage,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: AutoSizeText(
                  userName,
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
                '$jobDate as $jobHour',
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
              'Total: R\$ $totalPrice',
              style: AppTextStyles.headLine1Gold,
            ),
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
          const SizedBox(
            height: 2,
          ),
          Text(
            serviceDescription,
            style: AppTextStyles.headLine4,
          ),
          Visibility(
            visible: true,
            child: Column(
              children: [
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
                  userComentary,
                  style: AppTextStyles.headLine4,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.black,
          ),
          Center(
            child: Text(
              'Serviços a fazer:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            servicesTodo,
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
                  text: street,
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
                  text: city,
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
                  text: houseNumber,
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
                  text: district,
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
                  text: referencePoint,
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
              onPressed: cancelOnPressed,
              dialogButtonType: DialogButtonType.no,
              buttonText: 'Cancelar',
            ),
          ),
        ],
      ),
    );
  }
}
