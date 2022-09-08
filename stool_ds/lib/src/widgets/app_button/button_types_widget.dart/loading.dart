part of '../app_button.dart';
@immutable
class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: Adaptive.w(85),
          height: 6.h,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 5.0,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: [
                AppColors.buttonRightGradientColor,
                AppColors.buttonLeftGradientColor,
              ],
            ),
            borderRadius: BorderRadius.circular(20.dp),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0.dp),
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(50.w, 50.h)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: const Center(
              child: AppProgressIndicator()
            ),
          ),
        );
      },
    );
  }
}
