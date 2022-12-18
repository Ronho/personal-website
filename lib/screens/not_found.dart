import 'package:flutter/material.dart';

import 'package:personal_website/components/footer.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('404'),
          Footer(),
        ],
      ),
    );
  }
}
