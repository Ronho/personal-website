import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/blog.dart';
import 'package:personal_website/models/search_bar_item.dart';

class BlogsController extends GetxController {
  static BlogsController get to => Get.find();

  RxList<Blog> blogs = <Blog>[].obs;

  BlogsController() {
    getBlogs();
  }

  Future<void> getBlogs() async {
    final String jsonText =
        await rootBundle.loadString('assets/data/blogs.json');
    final dynamic json = jsonDecode(jsonText);
    List<Blog> blogs = [];
    for (dynamic blog in json) {
      Blog entry = Blog.fromJson(blog);
      entry.getText();
      blogs.add(entry);
    }
    this.blogs.assignAll(blogs);
  }

  Blog? getBlogById(String id) {
    return blogs.firstWhereOrNull((blog) => blog.id == id);
  }

  List<SearchBarItem> search(String text) {
    return blogs
        .where((e) => e.containsText(text))
        .map((e) => e.asSearchbarItem)
        .take(3)
        .toList();
  }
}
