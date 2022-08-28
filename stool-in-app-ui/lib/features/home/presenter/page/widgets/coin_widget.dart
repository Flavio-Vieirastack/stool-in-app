part of '../home_page.dart';

Widget _coin({required VoidCallback onTap, required String coins}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: coins.length == 3 ? 10.w : 15.w,
      child: Text(
        coins.length <= 5 ? coins : '${coins.substring(0,4)}+',
        softWrap: false,
        maxLines: 1,
        style: AppTextStyles.headLine3,
      ),
    ),
  );
}
