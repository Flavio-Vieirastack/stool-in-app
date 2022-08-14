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
  final String userState;
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
    required this.userState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppAvatar(urlImage: userUrlImage),
              SizedBox(
                width: 5.w,
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
              SizedBox(
                width: 5.w,
              ),
              Text(
                '$jobDate as $jobHour',
                style: AppTextStyles.headLine4Gold,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Total: R\$ $totalPrice',
              style: AppTextStyles.headLine1Gold,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Center(
            child: Text(
              'Descrição:',
              style: AppTextStyles.headLine4Gold,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            serviceDescription,
            style: AppTextStyles.headLine4,
          ),
          Visibility(
            visible: userComentaryVisible,
            child: Column(
              children: [
                Divider(
                  color: AppColors.black,
                ),
                Text(
                  'Comentário:',
                  style: AppTextStyles.headLine4Gold,
                ),
                SizedBox(
                  height: 1.h,
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
          SizedBox(
            height: 1.h,
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
              text: 'Estado: ',
              style: AppTextStyles.headLine2,
              children: <TextSpan>[
                TextSpan(
                  text: userState,
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
          SizedBox(
            height: 2.h,
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
