import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stool_in/core/helpers/theme/colors/app_colors.dart';

class AppAvatar extends StatelessWidget {
  final String? urlImage;
  final double size;
  const AppAvatar({Key? key, this.urlImage, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: SizedBox(
        height: size,
        width: size,
        child: urlImage != null
            ? CachedNetworkImage(
                imageUrl: urlImage ?? '',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.person),
              )
            : CircleAvatar(
                backgroundColor: AppColors.grey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.black,
                ),
              ),
      ),
    );
  }
}
