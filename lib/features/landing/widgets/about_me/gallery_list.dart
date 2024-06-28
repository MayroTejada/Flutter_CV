import 'package:flutter/material.dart';
import 'package:my_resume_app/core/paths/images_paths.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({super.key});

  @override
  State<GalleryList> createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      semanticChildCount: 5,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 40,
          crossAxisSpacing: 40,
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 5),
      children: [
        Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(flutterIconPath),
        ),
        Card(child: Image.asset(pugsAndMePath)),
        Card(child: Image.asset(reactIconPath)),
        Card(child: Image.asset(reactIconPath)),
        Card(child: Image.asset(reactIconPath))
      ],
    );
  }
}
