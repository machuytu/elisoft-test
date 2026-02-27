import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: ColoredBox(
        color: Colors.grey.shade200,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          memCacheWidth: 200,
          memCacheHeight: 200,
          fadeInDuration: const Duration(milliseconds: 120),
          placeholder: (BuildContext context, String url) {
            return const Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          },
          errorWidget: (BuildContext context, String url, Object error) {
            return const Center(child: Icon(Icons.broken_image_outlined));
          },
        ),
      ),
    );
  }
}
