import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:stool_in/core/widgets/app_progress_indicator/app_progress_indicator.dart';

class AppAvatar extends StatelessWidget {
  final String? urlImage;
  final double size;
  final bool isLoading;
  const AppAvatar({
    Key? key,
    this.urlImage,
    this.size = 50,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50.dp)),
      child: SizedBox(
        height: size,
        width: size,
        child: urlImage != null
            ? CachedNetworkImage(
                imageUrl: urlImage ?? '',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.person),
              )
            : SizedBox(
                child: CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: !isLoading
                      ? Icon(
                          Icons.person,
                          size: size - 10,
                          color: AppColors.black,
                        )
                      : const AppProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
