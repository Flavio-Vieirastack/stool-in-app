part of '../login_page.dart';

class _LoginCard extends StatelessWidget with ResponsiveHelperMixin {
  final BoxConstraints constraints;
  const _LoginCard({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight *
          responsiveHeight(
            defaultMobileHeight: 0.5,
            defaultMobileSmallSizeHeight: 0.5,
            defaultTabletHeight: 0.5,
            constraints: constraints,
          ),
      width: constraints.maxWidth *
          responsiveWidth(
            defaultMobileWidth: 0.9,
            defaultMobileSmallSizeWidth: 0.8,
            defaultTabletWidth: 0.8,
            constraints: constraints,
          ),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        children: const [
          SizedBox(
            height: 80,
          ),
          AppTextFormField(
            label: 'Email',
            hint: 'Ex: email@email.com',
            color: Colors.transparent,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextFormField(
            label: 'Senha',
            hint: 'Ex: Abc@123456',
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
