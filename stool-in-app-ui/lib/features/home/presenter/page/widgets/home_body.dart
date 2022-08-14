part of '../home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return ServiceProviderCards(
            userDistance: '45 M',
            userName: 'Nome do servidor',
            userServicesExecuted: 'userServicesExecuted',
            userUrlImage: 'userUrlImage',
            userVotes: '5',
            onPressed: () {},
          );
        },
      ),
    );
  }
}
