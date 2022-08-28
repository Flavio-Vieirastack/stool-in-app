part of '../home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categorias',
            style: AppTextStyles.headLine1,
          ),
          Text(
            'Ver todas',
            style: AppTextStyles.headLine4Blue,
          )
        ],
      ),
    );
  }
}
