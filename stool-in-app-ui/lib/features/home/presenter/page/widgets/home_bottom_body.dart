part of '../home_page.dart';

class HomeBottomBody extends StatelessWidget {
  final HomeBottomBodyParams homeBottomBodyParams;
  const HomeBottomBody({
    Key? key,
    required this.homeBottomBodyParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categorias',
              style: AppTextStyles.headLine1,
            ),
            Text(
              'Ver todas',
              style: AppTextStyles.headLine4Blue,
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        LimitedBox(
          maxHeight: 22.h,
          child: ListView.builder(
            itemCount: homeBottomBodyParams.categoriesEntity.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final categories = homeBottomBodyParams.categoriesEntity[index];
              return AppCategoryCard(
                onPressed: () {},
                categoryname: categories.categoryName,
                lottieUrl: categories.lottieUrl,
              );
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Melhor avaliados',
            style: AppTextStyles.headLine1,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        homeBottomBodyParams.serviceProviderEntity.isNotEmpty
            ? ListView.builder(
                itemCount: homeBottomBodyParams.serviceProviderEntity.length,
                shrinkWrap: true,
                primary: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final serviceProvider =
                      homeBottomBodyParams.serviceProviderEntity[index];
                  const uniqueIndex = 0;
                  return ServiceProviderCards(
                    serviceProviderCardsParams:
                        ServiceProviderCardsParams(
                      servicesExecuted: serviceProvider.executionServices
                          .map((e) => e.serviceName)
                          .toList(),
                      userDistance: homeBottomBodyParams
                          .serviceProviderEntity[index]
                          .distanceFormat(),
                      userName:
                          serviceProvider.userData[uniqueIndex].userName ?? '',
                      userServicesExecuted: 'serviceProvider.executionServices',
                      userUrlImage:
                          serviceProvider.userData[uniqueIndex].userPhotoUrl ??
                              '',
                      userVotes: serviceProvider.votes!.toDouble(),
                      cardOnTap: () {},
                      agendOnTap: () {},
                      image: Image.asset(AssetsConstants.calendarIcon),
                    ),
                  );
                },
              )
            : Column(
                children: [
                  LottieBuilder.asset(LottieConstants.lottieErrorPage),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Nenhum provedor de serviço encontrado, por favor, tente mais tarde',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headLine1,
                  )
                ],
              )
      ],
    );
  }
}
