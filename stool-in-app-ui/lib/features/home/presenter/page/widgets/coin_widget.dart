part of '../home_page.dart';

Widget _coin({required VoidCallback onTap, required String coins}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: coins.length == 3 ? 10.w : 15.w,
      child: Text(
        coins,
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.headLine3,
      ),
    ),
  );
}
