import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GalleryImageHero extends StatefulWidget {
  final String tag;
  final Widget? title;
  final Widget? description;
  final ImageProvider image;
  const GalleryImageHero(
      {super.key,
      this.title,
      required this.tag,
      required this.description,
      required this.image});

  @override
  State<GalleryImageHero> createState() => _GalleryImageHeroState();
}

class _GalleryImageHeroState extends State<GalleryImageHero> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
          transitionOnUserGestures: true,
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            return Material(
              child: SingleChildScrollView(
                child: widget,
              ),
            );
          },
          tag: widget.tag,
          child: Column(
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
          )),
    );
  }
}
