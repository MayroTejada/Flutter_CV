import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/theme/extensions/theme_data_extensions.dart';

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
          'Projects (in progress..)',
          style: Theme.of(context)
              .appTextsTheme
              .textStyle
              .copyWith(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const Gap(5),
        Image.asset('assets/projects/gallery.png'),
      ],
    );
  }
}
