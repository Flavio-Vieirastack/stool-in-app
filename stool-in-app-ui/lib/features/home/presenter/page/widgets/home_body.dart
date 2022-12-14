part of '../home_page.dart';

@immutable
class _HomeBody extends StatelessWidget {
  final String status;
  final HomeBottomBodyParams homeBottomBodyParams;
  const _HomeBody({
    Key? key,
    required this.status,
    required this.homeBottomBodyParams
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        if (status == ServiceStatus.inactive.status)
          const AppButton(
            buttonText: 'Seja um prestador',
            color: Colors.blue,
          ),
        if (status == ServiceStatus.active.status)
          const AppButton(
            buttonText: 'Ver meu perfil',
          ),
        if (status == ServiceStatus.completedAndInactive.status)
          if (status == ServiceStatus.active.status)
            const AppButton(
              buttonText: 'Renovar meu cadastro',
            ),
        SizedBox(
          height: 3.h,
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
              child: HomeBottomBody(
                homeBottomBodyParams: homeBottomBodyParams,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
