import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:personal_website/components/footer.dart';
import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/side_drawer.dart';
import 'package:personal_website/services/size.dart';

class ResponsiveController extends GetxController {}

class ScreenWrapper extends GetResponsiveView<ResponsiveController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;
  final double? maxWidth;

  ScreenWrapper({Key? key, required this.child, this.maxWidth})
      : super(key: key);

  @override
  Widget builder() {
    final double padding = SizeService.leftRightPadding(screen.width,
        maxWidth: maxWidth != null ? maxWidth! : SizeService.maxWidth);

    return Scaffold(
      key: scaffoldKey,
      drawer: const SideDrawer(),
      appBar: NavBar(
        scaffoldKey: scaffoldKey,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    EdgeInsets.only(top: 15, left: padding, right: padding),
                sliver: child,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Footer()
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
