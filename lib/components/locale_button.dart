import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:personal_website/controller/locale.dart';

class LocaleButton extends StatelessWidget {
  LocaleButton({Key? key}) : super(key: key);

  final LocaleController localeController = LocaleController.to;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: localeController.localeString,
      onChanged: (value) async {
        if (value != null) {
          await localeController.saveLocale(value);
          Get.updateLocale(localeController.locale);
        }
      },
      items: [
        DropdownMenuItem(
          value: 'en_US',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SvgPicture.asset(
                  'assets/images/flags/flag_us.svg',
                  width: 24,
                ),
              ),
              Text('en_US'.tr),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'de_DE',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SvgPicture.asset(
                  'assets/images/flags/flag_germany.svg',
                  width: 24,
                ),
              ),
              Text('de_DE'.tr),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'system',
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SvgPicture.asset(
                  'assets/images/flags/flag_system.svg',
                  width: 24,
                ),
              ),
              Text('system'.tr),
            ],
          ),
        ),
      ],
    );
  }
}
