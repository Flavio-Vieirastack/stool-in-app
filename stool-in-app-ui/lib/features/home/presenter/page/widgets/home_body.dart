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
          SizedBox(
            height: 22.h,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const AppCategoryCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
