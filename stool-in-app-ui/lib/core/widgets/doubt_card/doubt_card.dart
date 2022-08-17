import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';
import 'package:stool_in/core/helpers/theme/text_styles/app_text_styles.dart';

class DoubtCard extends StatelessWidget {
  const DoubtCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          'Birth of Universe',
          style: AppTextStyles.headLine3Gold,
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0.dp),
            child: Text(
              'but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: AppTextStyles.headLine4,
            ),
          ),
        ],
      ),
    );
  }
}
