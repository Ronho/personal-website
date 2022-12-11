import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:markdown/markdown.dart' as md;

import 'package:personal_website/controller/blogs.dart';
import 'package:personal_website/models/blog.dart';
import 'package:personal_website/screens/screen_wrapper.dart';
import 'package:personal_website/services/size.dart';

class ResponsiveController extends GetxController {}

class BlogDetailsScreen extends GetResponsiveView<ResponsiveController> {
  BlogDetailsScreen({Key? key}) : super(key: key);

  final BlogsController c = Get.put(BlogsController());

  @override
  Widget builder() {
    final double padding =
        SizeService.leftRightPadding(screen.width, maxWidth: 800);
    final String id =
        Get.parameters['id'] != null ? Get.parameters['id']! : '1';

    return ScreenWrapper(
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: Obx(() {
            final Blog? blog = c.getBlogById(id);
            if (blog == null) {
              return const CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 15, left: padding, right: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(blog.thumbnailPath),
                    SelectableText(
                      blog.title,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SelectableText(
                      '${DateFormat.yMMMd().format(blog.date)} • ${blog.authorsAsString}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Markdown(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      selectable: true,
                      extensionSet: md.ExtensionSet.gitHubWeb,
                      data: blog.body,
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
