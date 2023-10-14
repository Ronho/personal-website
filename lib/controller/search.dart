import 'package:get/get.dart';

import 'package:personal_website/controller/blogs.dart';
import 'package:personal_website/controller/experience.dart';
import 'package:personal_website/controller/projects.dart';
import 'package:personal_website/models/search_bar_item.dart';

class SearchBarController extends GetxController {
  static SearchBarController get to => Get.find();

  Rx<String> _lastSearch = ''.obs;
  String get lastSearch => _lastSearch.value;

  void updateLastSearch(String text) {
    _lastSearch.value = text;
    update();
  }

  List<SearchBarItem> search(String text) {
    BlogsController blogsController = BlogsController.to;
    ProjectsController projectsController = ProjectsController.to;
    ExperienceController experienceController = ExperienceController.to;
    return blogsController.search(text) +
        projectsController.search(text) +
        experienceController.search(text);
  }
}
