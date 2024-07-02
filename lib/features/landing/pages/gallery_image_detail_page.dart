import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return PopScope(
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(shrinkWrap: true, children: [
              GalleryImageHero(
                  size: const Size(500, 500),
                  tag: widget.args.tag,
                  title: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.args.title ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  description: Text(
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      widget.args.description ?? ''),
                  image: widget.args.image),
              const Gap(30),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.maybePop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ],
                ),
              )
            ]),
          ),
        ),
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
