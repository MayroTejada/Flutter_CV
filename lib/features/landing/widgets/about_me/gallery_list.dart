import 'package:flutter/material.dart';
import 'package:my_resume_app/features/landing/widgets/about_me/image_gallery.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class GalleryList extends StatefulWidget {
  final List<GalleryItem> items;
  final int itemsPerPage;
  const GalleryList({super.key, required this.items, this.itemsPerPage = 3});

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
  final AutoScrollController scrollController = AutoScrollController(
    axis: Axis.horizontal,
  );
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 500, minHeight: 300),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          bottom: 1,
          top: 1,
          right: 1,
          left: 1,
          child: GridView.builder(
            controller: scrollController,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            scrollDirection: Axis.horizontal,
            semanticChildCount: widget.itemsPerPage,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.itemsPerPage,
                mainAxisSpacing: 20,
                mainAxisExtent: MediaQuery.of(context).size.width),
            itemCount: widget.items.length,
            itemBuilder: (context, index) => AutoScrollTag(
              controller: scrollController,
              index: index,
              key: ValueKey(index),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  scrollController.scrollToIndex(index);
                },
                child: ImageGallery(
                    title: SizedBox(
                      height: 80,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.items.elementAt(index).title,
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
                          widget.items.elementAt(index).description),
                    ),
                    image: widget.items.elementAt(index).image),
              ),
            ),
          ),
        ),
        Positioned(
            left: 1,
            height: 60,
            child: Card(
              child: IconButton(
                  onPressed: () {
                    if (currentIndex >= 0) {
                      scrollController
                          .scrollToIndex(currentIndex = currentIndex - 1);
                    }
                  },
                  icon: const Icon(Icons.arrow_left)),
            )),
        Positioned(
            right: 1,
            height: 60,
            child: Card(
              child: IconButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (currentIndex < widget.items.length) {
                      scrollController
                          .scrollToIndex(currentIndex = currentIndex + 1);
                    }
                  },
                  icon: const Icon(Icons.arrow_right)),
            )),
      ]),
    );
  }
}
