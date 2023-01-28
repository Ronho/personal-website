import 'package:flutter/material.dart';

import 'package:personal_website/components/stepper_item.dart';
import 'package:personal_website/models/experience.dart';

class ExperienceStepper extends StatelessWidget {
  final Experience experience;
  final double elementHeight;
  final int index;
  final int experiencesLength;
  final bool wideMode;
  const ExperienceStepper(
      {Key? key,
      required this.experience,
      required this.elementHeight,
      required this.index,
      required this.experiencesLength,
      required this.wideMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepperItem(
          isFirst: index == 0,
          height: elementHeight,
          activeBarColor: Colors.blue,
          barWidth: 2,
          experience: experience,
          wide: wideMode,
        ),
        for (int jobIdx = 0; jobIdx < experience.jobs.length; jobIdx++)
          SubStepperItem(
            isLast: ((index == experiencesLength - 1) &
                (jobIdx == experience.jobs.length - 1)),
            activeBarColor: Colors.blue,
            barWidth: 2,
            gap: elementHeight,
            job: experience.jobs[jobIdx],
            wide: wideMode,
          ),
      ],
    );
  }
}
