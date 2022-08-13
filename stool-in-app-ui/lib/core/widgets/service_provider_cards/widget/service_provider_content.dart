part of '../service_provider_cards.dart';

class _ServiceProviderContent extends StatelessWidget {
  final String userUrlImage;
  final String userName;
  final String userVotes;
  final String userServicesExecuted;
  final String userDistance;
  const _ServiceProviderContent({
    Key? key,
    required this.userUrlImage,
    required this.userName,
    required this.userVotes,
    required this.userServicesExecuted,
    required this.userDistance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppAvatar(urlImage: userUrlImage),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0.dp),
                  child: AutoSizeText(
                    userName,
                    maxLines: 1,
                    maxFontSize: 16,
                    minFontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headLine1,
                  ),
                ),
              ),
              AppRattingStars(
                value: 3,
                size: 10.dp,
                onValueChanged: (value) {},
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Serviços:',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.buttonLeftGradientColor,
            ),
          ),
          SizedBox(
            width: 350.w,
            child: AutoSizeText(
              userServicesExecuted,
              textAlign: TextAlign.left,
              maxLines: 3,
              maxFontSize: 15.dp,
              minFontSize: 14.dp,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headLine2,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Distância: $userDistance',
              style: TextStyle(color: AppColors.buttonLeftGradientColor),
            ),
          )
        ],
      ),
    );
  }
}
