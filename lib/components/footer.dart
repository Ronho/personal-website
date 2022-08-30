import 'package:flutter/material.dart';

import 'package:personal_website/controller/theme.dart';
import 'package:personal_website/controller/locale.dart';

class Footer extends StatelessWidget implements PreferredSizeWidget {
  Footer({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  final ThemeController themeController = ThemeController.to;
  final LocaleController localeController = LocaleController.to;

  Widget build(BuildContext context) {
    return Container(
      width: preferredSize.width,
      height: preferredSize.height,
      color: Colors.black,
    );
  }
}
