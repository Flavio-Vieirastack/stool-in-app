part of '../home_page.dart';

@immutable
class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        const AppButton(
          buttonText: 'Seja um prestador',
          color: Colors.blue,
        ),
        SizedBox(
          height: 2.h,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.dp),
            topRight: Radius.circular(20.dp),
          ),
          child: ColoredBox(
            color: AppColors.black,
            child: Padding(
              padding: EdgeInsets.all(8.0.dp),
              child: const HomeBottomBody(),
            ),
          ),
        )
      ],
    );
  }
}
