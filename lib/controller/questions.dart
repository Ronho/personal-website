import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/question.dart';

class QuestionsController extends GetxController {
  RxInt _index = 0.obs;
  RxBool _show = false.obs;
  RxBool _hasLoaded = false.obs;
  final RxList<Question> _questions = <Question>[].obs;

  List<Question> get questions => _questions.value;
  bool get show => _show.value;
  bool get hasLoaded => _hasLoaded.value;

  QuestionsController() {
    getQuestions();
  }

  Future<void> getQuestions() async {
    final String jsonText =
        await rootBundle.loadString('assets/data/questions.json');
    final dynamic json = jsonDecode(jsonText);
    List<Question> questions = [];
    for (dynamic question in json) {
      questions.add(Question.fromJson(question));
    }
    questions.shuffle();
    _hasLoaded.value = true;
    _questions.assignAll(questions);
    update();
  }

  bool hasNext() {
    return (_index.value + 1 < _questions.length);
  }

  bool hasPrev() {
    return (_index.value - 1 >= 0 && _index.value - 1 < _questions.length);
  }

  void updateToNext() {
    if (hasNext()) {
      _index.value += 1;
      _show.value = false;
      update();
    }
  }

  void updateToPrev() {
    if (hasPrev()) {
      _index.value -= 1;
      _show.value = false;
      update();
    }
  }

  void showTrue() {
    _show.value = true;
    update();
  }

  void showFalse() {
    _show.value = false;
    update();
  }

  Question getQuestion() {
    return questions[_index.value];
  }
}
