import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../theme/text_styles/app_text_styles.dart';
@immutable
class InfoExpansionCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoExpansionCard({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: ExpansionTile(
          title: Text(
            title,
            style: AppTextStyles.headLine3Gold,
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0.dp),
              child: Text(
                content,
                style: AppTextStyles.headLine4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
