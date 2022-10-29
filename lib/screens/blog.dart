import 'dart:math';
import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/item_card.dart';

class ResponsiveController extends GetxController {}

class BlogScreen extends GetResponsiveView<ResponsiveController> {
  BlogScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: GridView.count(
            padding: EdgeInsets.only(top: 15, left: padding, right: padding),
            childAspectRatio: 1.2,
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 30,
            mainAxisSpacing: 15,
            crossAxisCount: getCrossAxisCount(screen.width),
            children: List.generate(10, (index) {
              return ItemCard(
                numLines: getNumLines(screen.width),
                coverPath: "assets/images/thumbnails/thumbnail.jpg",
                date: DateTime.now(),
                summary:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                title:
                    "My Headline Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
                onClick: () {
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
