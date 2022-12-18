import 'package:flutter/material.dart';

import 'package:personal_website/screens/screen_wrapper.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ScreenWrapper(
      child: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height - 56,
              color: Colors.blue,
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
