import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget childMobile;
  final Widget childDesktop;

  const ResponsiveLayout(
      {super.key, required this.childMobile, required this.childDesktop});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  bool isWideScreen = false;

  @override
  void didChangeDependencies() {
    final double width = MediaQuery.of(context).size.width;
    isWideScreen = width > 600;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return widget.childDesktop;
        } else {
          return widget.childMobile;
        }
      },
    );
  }
}
