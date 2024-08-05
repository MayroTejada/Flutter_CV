import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_resume_app/core/theme/extensions/theme_data_extensions.dart';

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
  late TextStyle textStyle;
  List<Text> responsabilities = [];

  buildResponsabilities() {
    responsabilities = [
      Text.rich(
        TextSpan(
          text: '- Develop and maintain mobile applications using ',
          children: [
            TextSpan(
                text: 'Flutter, Kotlin, and Swift.',
                style: textStyle.copyWith(fontWeight: FontWeight.bold))
          ],
        ),
      ),
      const Text.rich(TextSpan(
          text:
              '- Collaborate with designers, product managers, and backend developers to define app features and functionality.')),
      Text.rich(TextSpan(
        children: [
          const TextSpan(text: 'Implement '),
          TextSpan(
              text: 'RESTful APIs ',
              style: textStyle.copyWith(fontWeight: FontWeight.bold)),
          const TextSpan(
              text: 'to integrate mobile applications with backend services.')
        ],
        text: '-  ',
      )),
      Text.rich(TextSpan(
        children: [
          TextSpan(
              text: 'Perform unit and integration testing',
              style: textStyle.copyWith(fontWeight: FontWeight.bold)),
          const TextSpan(
            text:
                '- Perform unit and integration testing to ensure the quality and reliability of applications.',
          )
        ],
      )),
      const Text.rich(TextSpan(
        text:
            '- Participate in code reviews and provide constructive feedback to peers.',
      ))
    ];
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      textStyle = Theme.of(context).appTextsTheme.textStyle;
      buildResponsabilities();
    });
    super.initState();
  }

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image(image: widget.image),
                    Text(
                      widget.jobPosition,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                        '${DateFormat('yyyy-MM-dd').format(widget.jobRangeTime.start)}  - ${DateFormat('yyyy-MM-dd').format(widget.jobRangeTime.end)}'),
                    Text(widget.location)
                  ],
                ),
              ),
              Column(
                children: [
                  const Text('Key responsabilities'),
                  const Gap(5),
                  ...responsabilities.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            Expanded(
                              child: e,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
