import 'dart:math';

import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/controller/blogs.dart';
import 'package:personal_website/models/blog.dart';

class ResponsiveController extends GetxController {}

class BlogDetailsScreen extends GetResponsiveView<ResponsiveController> {
  BlogDetailsScreen({Key? key}) : super(key: key);

  final BlogsController c = Get.put(BlogsController());

  @override
  Widget builder() {
    final double padding = max((screen.width - 1260) / 2, 15);
    final String id =
        Get.parameters['id'] != null ? Get.parameters['id']! : '1';

    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 15, left: padding, right: padding),
          child: Obx(() {
            final Blog? blog = c.getBlogById(id);
            return Markdown(
              selectable: true,
              extensionSet: md.ExtensionSet.gitHubWeb,
              data: blog != null ? blog.body : '',
            );
          }),
        ),
      ),
    );
  }
}
