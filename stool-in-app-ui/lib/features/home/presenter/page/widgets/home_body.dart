part of '../home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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
        const Divider(thickness: 2),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            AppMenuButton(
              buttonName: 'Ajustes',
              icon: Icons.settings,
              onPressed: (){},
            ),
            AppMenuButton(
              buttonName: 'Duvidas',
              icon: Icons.info,
              onPressed: () => Navigator.of(context).pushNamed(RoutesConstants.infoRoute),
            ),
            AppMenuButton(
              buttonName: 'Ajustes',
              icon: Icons.settings,
              onPressed: (){},
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        const Divider(thickness: 2),
        Text(
          'Principais escolhas:',
          style: AppTextStyles.headLine3Gold,
        ),
        SizedBox(
          height: 2.h,
        ),
        
      ],
    );
  }
}
