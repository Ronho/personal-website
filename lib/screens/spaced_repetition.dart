import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:personal_website/models/question.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:personal_website/controller/questions.dart';
import 'package:personal_website/screens/screen_wrapper.dart';

class ResponsiveController extends GetxController {}

class SpacedRepetitionScreen extends GetResponsiveView<ResponsiveController> {
  SpacedRepetitionScreen({Key? key}) : super(key: key);

  final QuestionsController c = Get.put(QuestionsController());

  Widget getMarkdownCard(String data, String text) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Markdown(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            selectable: true,
            extensionSet: md.ExtensionSet.gitHubWeb,
            data: data,
            onTapLink: (text, url, title) {
              if (url != null) {
                final uri = Uri.parse(url);
                launchUrl(uri);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget getContent(Question q) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              DropdownButton<int>(
                value: c.selectedDeckIdx,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (int? value) {
                  c.selectDeck(value!);
                },
                items: c.questionDecks.asMap().entries.map<DropdownMenuItem<int>>((e) {
                  int idx = e.key;
                  QuestionDeck deck = e.value;
                  return DropdownMenuItem<int>(
                    value: idx,
                    child: Text(deck.name),
                  );
                }).toList(),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                overflowButtonSpacing: 8.0,
                children: [
                  OutlinedButton(
                    onPressed: c.hasPrev() ? c.updateToPrev : null,
                    child: Text('back'.tr),
                  ),
                  OutlinedButton(
                      onPressed: c.show ? c.showFalse : c.showTrue,
                      child: c.show ? Text('hide'.tr) : Text('show'.tr)),
                  OutlinedButton(
                    onPressed: c.hasNext() ? c.updateToNext : null,
                    child: Text('next'.tr),
                  )
                ],
              ),
            ],
          ),
        ),
        getMarkdownCard(q.question, 'question'.tr),
        if (c.show) getMarkdownCard(q.answer, 'answer'.tr)
      ],
    );
  }

  Widget getLoader() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget builder() {
    return ScreenWrapper(
      child: SliverToBoxAdapter(
        child: Obx(() {
          if (c.hasLoaded) {
            return getContent(c.getQuestion());
          } else {
            return getLoader();
          }
        }),
      ),
    );
  }
}
