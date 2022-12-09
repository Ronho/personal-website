import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/item_card.dart';
import 'package:personal_website/controller/projects.dart';
import 'package:personal_website/models/project.dart';

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
    final double padding = max((screen.width - 1260) / 2, 15);

    return Scaffold(
      appBar: NavBar(),
      body: Obx(() {
        return Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: GridView(
              padding: EdgeInsets.only(top: 15, left: padding, right: padding),
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(screen.width),
                crossAxisSpacing: 30,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              children: [
                for (Project project in c.projects)
                  ItemCard(
                    numLines: getNumLines(screen.width),
                    thumbnailPath: project.thumbnailPath,
                    date: project.date,
                    summary: project.summary,
                    title: project.title,
                    onClick: project.onTap,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
