import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/item_card.dart';
import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/side_drawer.dart';
import 'package:personal_website/controller/blogs.dart';
import 'package:personal_website/models/blog.dart';
import 'package:personal_website/services/size.dart';

class ResponsiveController extends GetxController {}

class BlogScreen extends GetResponsiveView<ResponsiveController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  BlogScreen({Key? key}) : super(key: key);

  final BlogsController c = BlogsController.to;

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
    final double padding = SizeService.leftRightPadding(screen.width);

    return Scaffold(
      key: scaffoldKey,
      drawer: const SideDrawer(),
      appBar: NavBar(
        scaffoldKey: scaffoldKey,
      ),
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
                for (Blog blog in c.blogs)
                  ItemCard(
                    numLines: getNumLines(screen.width),
                    thumbnailPath: blog.thumbnailPath,
                    date: blog.date,
                    summary: blog.summary,
                    title: blog.title,
                    onClick: () {
                      Get.toNamed('/blog/${blog.id}');
                    },
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
