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
              return AppCategoryCard();
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        
      ],
    );
  }
}
