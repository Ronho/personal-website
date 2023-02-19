import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:personal_website/screens/screen_wrapper.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  Widget buildText() {
    return Column(
      children: [
        SelectableText(
          'welcome'.tr,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SelectableText(
          'motivation_text'.tr,
          style: const TextStyle(
            fontSize: 24,
            // color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x54000000),
            spreadRadius: 4,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset('assets/images/view.gif', scale: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool smallScreen = screenSize.width < 1400;
    final double maxWidth =
        smallScreen ? screenSize.width : screenSize.width - 300;

    return ScreenWrapper(
      maxWidth: maxWidth,
      child: SliverToBoxAdapter(
        child: Column(children: [
          if (smallScreen)
            Column(children: [
              buildImage(),
              const SizedBox(height: 64),
              buildText(),
            ])
          else
            Row(children: [
              Expanded(child: buildImage()),
              const SizedBox(width: 64),
              Expanded(child: buildText()),
            ]),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
    );
  }
}
