import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/stepper_item.dart';
import 'package:personal_website/controller/experience.dart';
import 'package:personal_website/models/experience.dart';

class ResponsiveController extends GetxController {}

class ExperienceScreen extends GetResponsiveView<ResponsiveController> {
  ExperienceScreen({Key? key}) : super(key: key);

  final ExperienceController c = Get.put(ExperienceController());

  @override
  Widget builder() {
    final double width = screen.width;
    final double padding = max((width - 1260) / 2, 15);
    final double elementHeight = (width / 2 - padding) * 9 / 16;

    final bool wideMode = width > 600;

    return Scaffold(
      appBar: NavBar(),
      body: Obx(() {
        List<Experience> experiences = c.experience;
        return Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 15, left: padding, right: padding),
            child: Column(
              children: [
                SelectableText(
                  'experience_screen_title'.tr,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                for (int experienceIdx = 0;
                    experienceIdx < experiences.length;
                    experienceIdx++) ...[
                  StepperItem(
                    isFirst: experienceIdx == 0,
                    height: elementHeight,
                    activeBarColor: Colors.blue,
                    barWidth: 2,
                    experience: experiences[experienceIdx],
                    wide: wideMode,
                  ),
                  for (int jobIdx = 0;
                      jobIdx < experiences[experienceIdx].jobs.length;
                      jobIdx++)
                    SubStepperItem(
                      isLast: ((experienceIdx == experiences.length - 1) &
                          (jobIdx ==
                              experiences[experienceIdx].jobs.length - 1)),
                      activeBarColor: Colors.blue,
                      barWidth: 2,
                      gap: elementHeight,
                      job: experiences[experienceIdx].jobs[jobIdx],
                      wide: wideMode,
                    ),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }
}
