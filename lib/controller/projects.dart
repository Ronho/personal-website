import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/project.dart';
import 'package:personal_website/models/search_bar_item.dart';

class ProjectsController extends GetxController {
  static ProjectsController get to => Get.find();

  RxList<Project> projects = <Project>[].obs;

  ProjectsController() {
    getProjects();
  }

  Future<void> getProjects() async {
    final String jsonText =
        await rootBundle.loadString('assets/data/projects.json');
    final dynamic json = jsonDecode(jsonText);
    List<Project> projects = [];
    for (dynamic project in json) {
      projects.add(Project.fromJson(project));
    }
    this.projects.assignAll(projects);
  }

  List<SearchBarItem> search(String text) {
    return projects
        .where((e) => e.containsText(text))
        .map((e) => e.asSearchbarItem)
        .take(3)
        .toList();
  }
}
