import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_ds/stool_ds.dart';
import 'package:stool_in_core/stool_in_core.dart';

class HomeBottomBody extends StatelessWidget {

  const HomeBottomBody({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Column(children: [
         
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
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const AppCategoryCard();
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
            itemCount: 10,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return ServiceProviderCards(
                userDistance: '1 Km',
                userName: 'João pedro',
                userServicesExecuted: 'Lavagem de carro',
                userUrlImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK9gqFKRn28xKHD1CAbEevdzsLmsv5yQkGnQ&usqp=CAU',
                userVotes: 4,
                onPressed: () {},
                agendOnTap: () {},
                image: Image.asset(AssetsConstants.calendarIcon),
              );
            },
          )
       ],);
  }
}