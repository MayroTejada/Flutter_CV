import 'package:flutter/material.dart';

class JobResumeCard extends StatefulWidget {
  final List<String> keyResponsabilities;
  final String jobPosition;
  final DateTimeRange jobRangeTime;
  final String location;
  final ImageProvider image;

  const JobResumeCard(
      {super.key,
      required this.keyResponsabilities,
      required this.image,
      required this.jobPosition,
      required this.jobRangeTime,
      required this.location});

  @override
  State<JobResumeCard> createState() => _JobResumeCardState();
}

class _JobResumeCardState extends State<JobResumeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.9),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Column(
                children: [Image(image: widget.image)],
              ),
              const Column(
                children: [Text('Key responsabilities')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
