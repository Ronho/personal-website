import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/item_card.dart';
import 'package:personal_website/controller/projects.dart';
import 'package:personal_website/models/project.dart';
import 'package:personal_website/screens/screen_wrapper.dart';

class ResponsiveController extends GetxController {}

class ProjectScreen extends GetResponsiveView<ResponsiveController> {
  ProjectScreen({Key? key}) : super(key: key);

  final ProjectsController c = ProjectsController.to;

  int getCrossAxisCount(double screenWidth) {
    if (screenWidth < 455) {
      return 1;
    } else if (screenWidth < 680) {
      return 2;
    } else {
      return 3;
    }
  }

  int getNumLines(double screenWidth) {
    if (screenWidth < 285) {
      return 1;
    } else if (screenWidth < 455) {
      return 2;
    } else if (screenWidth < 575) {
      return 1;
    } else if (screenWidth < 680) {
      return 2;
    } else if (screenWidth < 855) {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget builder() {
    return ScreenWrapper(
      child: Obx(() {
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(screen.width),
            crossAxisSpacing: 30,
            mainAxisSpacing: 15,
            childAspectRatio: 1.2,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            Project project = c.projects[index];
            return ItemCard(
              numLines: getNumLines(screen.width),
              thumbnailPath: project.thumbnailPath,
              date: project.date,
              summary: project.summary,
              title: project.title,
              onClick: project.onTap,
            );
          }, childCount: c.projects.length),
        );
      }),
    );
  }
}
