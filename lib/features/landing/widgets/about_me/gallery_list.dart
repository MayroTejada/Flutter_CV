import 'package:flutter/material.dart';
import 'package:my_resume_app/core/paths/images_paths.dart';
import 'package:my_resume_app/core/responsive/responsive_layout.dart';
import 'package:my_resume_app/features/landing/widgets/about_me/image_gallery.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class GalleryList extends StatefulWidget {
  final List<GalleryItem> items;
  const GalleryList({super.key, required this.items});

  @override
  State<GalleryList> createState() => _GalleryListState();
}

class GalleryItem {
  final String title;
  final String description;
  final ImageProvider image;

  GalleryItem(
      {required this.title, required this.description, required this.image});
}

class _GalleryListState extends State<GalleryList> {
  final AutoScrollController scrollController = AutoScrollController();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 500, minHeight: 300),
      child: ResponsiveLayout(
        childMobile: Stack(children: [
          Positioned(
            bottom: 1,
            top: 1,
            right: 1,
            left: 1,
            child: GridView(
              controller: scrollController,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              scrollDirection: Axis.horizontal,
              semanticChildCount: 1,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 * 1.5, crossAxisCount: 1),
              children: [
                ...widget.items
                    .map((e) => ImageGallery(
                        title: SizedBox(
                          height: 80,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              e.title,
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
                              e.description),
                        ),
                        image: e.image))
                    .toList()
              ],
            ),
          ),
          Positioned(
              bottom: 1,
              top: 1,
              child: IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                        scrollController.position.pixels - 100,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_left))),
          Positioned(
              right: 1,
              bottom: 1,
              top: 1,
              child: IconButton(
                  onPressed: () {
                    scrollController.animateTo(
                        scrollController.position.pixels + 100,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_right))),
        ]),
        childDesktop: GridView(
          semanticChildCount: 5,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 40,
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 5),
          children: [
            Image.asset(pugsAndMePath),
            Image.asset(pugsAndMePath),
            Image.asset(pugsAndMePath),
            Image.asset(pugsAndMePath),
            Image.asset(pugsAndMePath)
          ],
        ),
      ),
    );
  }
}
