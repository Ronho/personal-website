import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/side_drawer.dart';

class ScreenWrapper extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;

  ScreenWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideDrawer(),
      appBar: NavBar(
        scaffoldKey: scaffoldKey,
      ),
      body: child,
    );
  }
}
