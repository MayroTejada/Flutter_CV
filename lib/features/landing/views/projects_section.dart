import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Projects',
          style: TextStyle(fontSize: 38, color: Theme.of(context).primaryColor),
        ),
        const Placeholder(),
      ],
    );
  }
}
