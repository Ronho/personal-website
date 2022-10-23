import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/blog_card.dart';

class ResponsiveController extends GetxController {}

class BlogScreen extends GetResponsiveView<ResponsiveController> {
  BlogScreen({Key? key}) : super(key: key);

  int getCrossAxisCount(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.Watch:
        return 1;
      case ScreenType.Phone:
        return 1;
      case ScreenType.Tablet:
        return 2;
      default:
        return 2;
    }
  }
  int xgetCrossAxisCount(double screenWidth) {
    if (screenWidth < 500) {
      return 1;
    } else {
      return 2;
    }
  }

  int getNumLines(double screenWidth) {
    if (screenWidth < 275) {
      return 1;
    } else if (screenWidth < 375) {
      return 2;
    } else if (screenWidth < 500) {
      return 5;
    } else if (screenWidth < 520) {
      return 1;
    } else if (screenWidth < 600) {
      return 2;
    } else if (screenWidth < 1000) {
      return 3;
    } else {
      return 8;
    }
  }

  @override
  Widget builder() {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 1000),
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: xgetCrossAxisCount(screen.width),
            children: List.generate(10, (index) {
              return BlogCard(
                numLines: getNumLines(screen.width),
              );
            }),
          ),
        ),
      ),
    );
  }
}
