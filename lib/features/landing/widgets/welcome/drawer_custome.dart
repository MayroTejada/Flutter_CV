import 'package:flutter/material.dart';

class DrawerCustome extends StatefulWidget {
  final PageController pageController;
  const DrawerCustome({super.key, required this.pageController});

  @override
  State<DrawerCustome> createState() => _DrawerCustomeState();
}

class _DrawerCustomeState extends State<DrawerCustome> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Drawer(
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate.fixed([
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.jumpTo(0);
                },
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  widget.pageController.jumpTo(1);
                },
                title: const Text('About me'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Works'),
              ),
              ListTile(
                onTap: () {},
                title: const Text('Projects'),
              )
            ])),
          ],
        ),
      ),
    );
  }
}
