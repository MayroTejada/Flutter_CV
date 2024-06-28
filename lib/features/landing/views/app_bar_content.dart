import 'package:flutter/material.dart';
import 'package:my_resume_app/core/responsive/responsive_layout.dart';
import 'package:my_resume_app/core/widgets/app_bar/sliver_app_bar.dart';
import 'package:my_resume_app/core/widgets/link_button.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AppBarContent extends StatefulWidget {
  final AutoScrollController scrollController;
  final Map<String, ValueKey<int>> categoryKeys;
  const AppBarContent(
      {super.key, required this.categoryKeys, required this.scrollController});

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> items = [
      CategoryItem('Home', 'route', widget.categoryKeys['home']!),
      CategoryItem('About', 'route', widget.categoryKeys['About_me']!),
      CategoryItem('Works', 'route', widget.categoryKeys['home']!),
      CategoryItem('Projects', 'route', widget.categoryKeys['home']!),
    ];
    return ResponsiveLayout(
      isSliver: true,
      childMobile: SliverAppBar(
        snap: true,
        elevation: 3,
        forceElevated: true,
        floating: true,
        pinned: true,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
      ),
      childDesktop: SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: SliverAppBarDelegate(
          maxHeight: 130,
          minHeight: 80,
          child: Material(
            elevation: 1,
            child: Row(
              children: [
                ...items
                    .map((e) => LinkButton(
                          onCallback: () {
                            widget.scrollController
                                .scrollToIndex(e.keySection.value);
                          },
                          text: e.name,
                          style: const TextStyle(fontSize: 20),
                        ))
                    .toList(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Contact me',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String route;
  final ValueKey<int> keySection;

  CategoryItem(this.name, this.route, this.keySection);
}