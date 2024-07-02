import 'package:flutter/material.dart';

class WorkSection extends StatefulWidget {
  const WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Works',
          style: TextStyle(fontSize: 38, color: Theme.of(context).primaryColor),
        ),
        const Placeholder()
      ],
    );
  }
}
