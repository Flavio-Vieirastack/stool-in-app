part of '../app_button.dart';

class _Disabled extends StatelessWidget {
  final String buttonText;
  const _Disabled({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: Adaptive.w(50),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 5.0,
                )
              ],
              color: AppColors.greyDisabled,
              borderRadius: BorderRadius.circular(20.dp),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.dp),
                  ),
                ),
                minimumSize: MaterialStateProperty.all( Size(50.w, 50.h)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: AppTextStyles.headLine1,
              ),
            ),
          );
        },
      ),
    );
  }
}
