import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in/features/home/presenter/page/params/home_bottom_body_params.dart';
import 'package:stool_in_core/stool_in_core.dart';

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
        ListView.builder(
          itemCount: homeBottomBodyParams.serviceProviderEntity.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            final serviceProvider =
                homeBottomBodyParams.serviceProviderEntity[index];
            const uniqueIndex = 0;
            return ServiceProviderCards(
              serviceProviderCardsParams: ServiceProviderCardsParams(
                userDistance: serviceProvider.distanceFormat(),
                userName: serviceProvider.userData[uniqueIndex].userName ?? '',
                userServicesExecuted: 'serviceProvider.executionServices',
                userUrlImage:
                    serviceProvider.userData[uniqueIndex].userPhotoUrl ?? '',
                userVotes: serviceProvider.votes!.toDouble(),
                cardOnTap: () {},
                agendOnTap: () {},
                image: Image.asset(AssetsConstants.calendarIcon),
              ),
            );
          },
        )
      ],
    );
  }
}
