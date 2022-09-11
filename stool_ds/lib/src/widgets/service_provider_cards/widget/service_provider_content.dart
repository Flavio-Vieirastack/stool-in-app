part of '../service_provider_cards.dart';

@immutable
class _ServiceProviderContent extends StatelessWidget {
  final ServiceProviderCardsParams serviceProviderCardsParams;
  const _ServiceProviderContent({
    Key? key,
    required this.serviceProviderCardsParams,
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
              AppAvatar(
                urlImage: serviceProviderCardsParams.userUrlImage,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5.0.dp),
                  child: AutoSizeText(
                    serviceProviderCardsParams.userName,
                    maxLines: 1,
                    maxFontSize: 20,
                    minFontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headLine1,
                  ),
                ),
              ),
              AppRattingStars(
                value: serviceProviderCardsParams.userVotes,
                size: 10.dp,
                onValueChanged: (value) {},
              ),
              SizedBox(
                width: 1.w,
              ),
              Visibility(
                visible: serviceProviderCardsParams.userVotes >= 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        LottieConstants.lottieQuality,
                        width: 35.dp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text(
            'Serviços:',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.buttonLeftGradientColor,
            ),
          ),
          SizedBox(
            height: 8.h,
            child: ListView.builder(
              itemCount: serviceProviderCardsParams.servicesExecuted.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(3.dp),
                  child: Chip(
                    backgroundColor: AppColors.orange,
                    label: Text(
                      serviceProviderCardsParams.servicesExecuted[index],
                      style: AppTextStyles.headLine4.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    avatar: const Icon(Icons.engineering),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text( // TODO adicionar textspan aqui
            'Distância: ${serviceProviderCardsParams.userDistance}',
            style: const TextStyle(color: AppColors.buttonLeftGradientColor),
          ),
          SizedBox(
            height: 1.h,
          ),
          GestureDetector(
            onTap: serviceProviderCardsParams.agendOnTap,
            child: Align(
              alignment: Alignment.centerRight,
              child: serviceProviderCardsParams.image,
            ),
          )
        ],
      ),
    );
  }
}
