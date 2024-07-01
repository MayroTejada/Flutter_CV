import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/hero/gallery_item_hero.dart';

@RoutePage()
class GalleryImageDetailPage extends StatefulWidget {
  final GalleryArgsPath args;
  const GalleryImageDetailPage({super.key, required this.args});

  @override
  State<GalleryImageDetailPage> createState() => _GalleryImageDetailPageState();
}

class _GalleryImageDetailPageState extends State<GalleryImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GalleryImageHero(
              tag: widget.args.tag,
              title: SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.args.title ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              description: SizedBox(
                height: 80,
                child: Text(
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    widget.args.description ?? ''),
              ),
              image: widget.args.image)
        ],
      ),
    );
  }
}

class GalleryArgsPath {
  final String tag;
  final String? description;
  final String? title;
  final ImageProvider image;

  GalleryArgsPath(
      {required this.tag,
      required this.description,
      required this.title,
      required this.image});
}
