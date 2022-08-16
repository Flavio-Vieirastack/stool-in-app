part of '../home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixedLengthList =
        List<int>.generate(10, (int index) => index * index, growable: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          height: 24.h,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const AppCategoryCard();
            },
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          height: 10.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              AppMenuButton(
                buttonName: 'Ajustes',
                icon: Icons.settings,
              ),
              AppMenuButton(
                buttonName: 'Ajustes',
                icon: Icons.settings,
              ),
              AppMenuButton(
                buttonName: 'Ajustes',
                icon: Icons.settings,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text('Principais escolhas:', style: AppTextStyles.headLine3Gold,),
        SizedBox(
          height: 2.h,
        ),
        Column(
          children: fixedLengthList
              .map(
                (e) => ServiceProviderCards(
                  userDistance: 'userDistance',
                  userName: 'userName',
                  userServicesExecuted: 'userServicesExecuted',
                  userUrlImage: 'userUrlImage',
                  userVotes: '5',
                  onPressed: () {},
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
