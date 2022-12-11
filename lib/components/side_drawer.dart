import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
              onTap: () {
                Get.toNamed('/');
              },
              title: Text('home'.tr)),
          ListTile(
              onTap: () {
                Get.toNamed('/experience');
              },
              title: Text('experience'.tr)),
          ListTile(
              onTap: () {
                Get.toNamed('/projects');
              },
              title: Text('projects'.tr)),
          ListTile(
              onTap: () {
                Get.toNamed('/blog');
              },
              title: Text('blog'.tr)),
        ],
      ),
    );
  }
}
