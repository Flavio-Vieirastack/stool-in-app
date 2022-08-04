import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String urlImage;
  const AppAvatar({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: SizedBox(
        height: 50,
        width: 50,
        child: CachedNetworkImage(
          imageUrl: urlImage,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
