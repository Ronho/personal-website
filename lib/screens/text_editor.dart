import 'package:flutter/material.dart';
import 'package:latext/latext.dart';

import 'package:personal_website/screens/screen_wrapper.dart';

class TextEditorScreen extends StatefulWidget {
  const TextEditorScreen({super.key});

  @override
  State<TextEditorScreen> createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  GlobalKey globalKey = GlobalKey();
  final TextEditingController _inputController =
      TextEditingController(text: "input");

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: SliverToBoxAdapter(
        child: Column(
          children: [
            Card(
              child: TextField(
                maxLines: 10,
                controller: _inputController,
                key: globalKey,
                onChanged: (text) => setState(() {}),
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LaTexT(
                    laTeXCode: Text(_inputController.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
