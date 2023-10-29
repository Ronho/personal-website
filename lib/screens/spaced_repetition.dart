import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latext/latext.dart';
import 'package:personal_website/models/question.dart';

import 'package:personal_website/controller/questions.dart';
import 'package:personal_website/screens/screen_wrapper.dart';

class ResponsiveController extends GetxController {}

class SpacedRepetitionScreen extends GetResponsiveView<ResponsiveController> {
  SpacedRepetitionScreen({Key? key}) : super(key: key);

  final QuestionsController c = Get.put(QuestionsController());

  Widget getTextCard(String data, String text) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SelectableText(
                text,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LaTexT(
                laTeXCode: Text(data),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDeckSelection() {
    return DropdownButton<int>(
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
    );
  }

  Widget getNoQuestionLeft() {
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (c.questionDecks.isNotEmpty)
                Center(child: getDeckSelection())
              else
                Text('sorry'.tr),
            ],
          ),
        ),
        getTextCard('no_more_questions'.tr, 'done'.tr)
      ],
    );
  }

  Widget getContent(Question q) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              if (c.questionDecks.isNotEmpty) getDeckSelection(),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                overflowButtonSpacing: 8.0,
                children: c.show
                    ? [
                        OutlinedButton(
                          onPressed: () => c.updateToNext(Difficulty.easy),
                          child: Text('easy'.tr),
                        ),
                        OutlinedButton(
                          onPressed: () => c.updateToNext(Difficulty.medium),
                          child: Text('medium'.tr),
                        ),
                        OutlinedButton(
                          onPressed: () => c.updateToNext(Difficulty.hard),
                          child: Text('hard'.tr),
                        ),
                      ]
                    : [
                        OutlinedButton(
                          onPressed: c.showTrue,
                          child: c.show ? Text('hide'.tr) : Text('show'.tr),
                        ),
                      ],
              ),
            ],
          ),
        ),
        getTextCard(q.question, 'question'.tr),
        if (c.show) getTextCard(q.answer, 'answer'.tr)
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
            Question? question = c.getQuestion();
            if (question == null) {
              return getNoQuestionLeft();
            } else {
              return getContent(question);
            }
          } else {
            return getLoader();
          }
        }),
      ),
    );
  }
}
