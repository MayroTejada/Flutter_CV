import 'package:flutter/material.dart';
import 'package:my_resume_app/core/widgets/link_button.dart';

class AppBarContent extends StatefulWidget {
  const AppBarContent({super.key});

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  final List<CategoryItem> items = [
    CategoryItem('Home', 'route'),
    CategoryItem('About', 'route'),
    CategoryItem('Works', 'route'),
    CategoryItem('Projects', 'route'),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Row(
        children: [
          ...items
              .map((e) => LinkButton(
                    text: e.name,
                    style: const TextStyle(fontSize: 20),
                  ))
              .toList(),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(),
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
    );
  }
}

class CategoryItem {
  final String name;
  final String route;

  CategoryItem(this.name, this.route);
}
