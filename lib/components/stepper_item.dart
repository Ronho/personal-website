import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:personal_website/components/stepper_dot.dart';
import 'package:personal_website/models/experience.dart';
import 'package:personal_website/models/job.dart';

class SubStepperItem extends StatelessWidget {
  const SubStepperItem({
    Key? key,
    required this.isLast,
    required this.gap,
    required this.activeBarColor,
    required this.barWidth,
    required this.job,
    this.wide = false,
  }) : super(key: key);

  final bool isLast;
  final double gap;
  final Color activeBarColor;
  final double barWidth;
  final Job job;
  final bool wide;

  Widget getDate() {
    return SelectableText(
      '${DateFormat.yM().format(job.startDate)} - ${job.endDate == 'Present' ? job.endDate : DateFormat.yM().format(job.endDate)}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double dotSize = 15;

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (wide) ...[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  getDate(),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
          const SizedBox(width: 7.5),
          Column(
            children: [
              Container(
                color: activeBarColor,
                width: barWidth,
                height: 10,
              ),
              const SubStepperDot(size: dotSize),
              Expanded(
                child: Container(
                  color: isLast ? Colors.transparent : activeBarColor,
                  width: barWidth,
                  // height: 100,
                ),
              ),
            ],
          ),
          const SizedBox(width: 15.5),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  job.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (!wide) ...[
                  getDate(),
                ],
                const SizedBox(
                  height: 16,
                ),
                MarkdownBody(
                  listItemCrossAxisAlignment:
                      MarkdownListItemCrossAxisAlignment.start,
                  shrinkWrap: true,
                  selectable: true,
                  extensionSet: md.ExtensionSet.gitHubWeb,
                  data: job.body,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StepperItem extends StatelessWidget {
  const StepperItem({
    Key? key,
    required this.isFirst,
    required this.height,
    required this.activeBarColor,
    required this.barWidth,
    required this.experience,
    this.wide = false,
  }) : super(key: key);

  final bool isFirst;
  final double height;
  final Color activeBarColor;
  final double barWidth;
  final Experience experience;
  final bool wide;

  Widget getCard() {
    return Expanded(
      flex: 2,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: experience.backgroundColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            Center(
              child: SvgPicture.asset(experience.logoPath),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double dotSize = 30;

    return IntrinsicHeight(
      child: Row(
        children: [
          if (wide) ...[
            getCard(),
            const SizedBox(width: 8),
          ],
          Column(
            children: [
              Expanded(
                child: Container(
                  color: isFirst ? Colors.transparent : activeBarColor,
                  width: barWidth,
                ),
              ),
              const StepperDot(size: dotSize),
              Expanded(
                child: Container(
                  color: activeBarColor,
                  width: barWidth,
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
          wide
              ? Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              : getCard(),
        ],
      ),
    );
  }
}
