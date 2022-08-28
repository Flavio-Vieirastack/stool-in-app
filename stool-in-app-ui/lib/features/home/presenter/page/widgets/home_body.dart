part of '../home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dp),
      child: Column(
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
              'Navegue',
              style: AppTextStyles.headLine1,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppMenuButton(
                buttonName: 'Perfil',
                icon: Icons.person,
                onPressed: () {
                  log('message');
                },
              ),
              AppMenuButton(
                buttonName: 'Info',
                icon: Icons.info,
                onPressed: () {},
              ),
              AppMenuButton(
                buttonName: 'Premium',
                lottieAsset: LottieConstants.lottieBecomePremium,
                onPressed: () {},
              ),
            ],
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
              );
            },
          )
        ],
      ),
    );
  }
}
