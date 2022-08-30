import 'package:flutter/material.dart';

import 'package:personal_website/components/nav_bar.dart';
import 'package:personal_website/components/footer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(),
          Container(
            width: screenSize.width,
            height: screenSize.height - 56,
            color: Colors.blue,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.red,
          ),
          Footer(),
        ],
      ),
    );
  }
}
