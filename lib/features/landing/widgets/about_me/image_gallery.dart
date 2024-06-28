import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImageGallery extends StatefulWidget {
  final Widget? description;
  final Widget? title;
  final ImageProvider image;
  const ImageGallery(
      {super.key, this.description, this.title, required this.image});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (widget.description != null) {
              return widget.title!;
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        const Gap(15),
        Image(
          height: 300,
          image: widget.image,
        ),
        const Gap(15),
        LayoutBuilder(
          builder: (context, constraints) {
            if (widget.description != null) {
              return widget.description!;
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
