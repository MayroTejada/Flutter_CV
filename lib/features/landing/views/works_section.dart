import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_resume_app/core/paths/images_paths.dart';
import 'package:my_resume_app/features/landing/widgets/works/job_resume_card.dart';

class WorkSection extends StatefulWidget {
  const WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Works',
              style: TextStyle(
                  fontSize: 38, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        SizedBox(
          height: 500,
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return JobResumeCard(
                    keyResponsabilities: const ['', ''],
                    image: const AssetImage(controllaJobPath),
                    jobPosition: 'Mobile Developer',
                    jobRangeTime: DateTimeRange(
                        start: DateTime(2017, 4, 1), end: DateTime.now()),
                    location: 'Chihauhua');
              },
            ),
          ),
        )
      ],
    );
  }
}
