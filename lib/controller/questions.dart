import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:personal_website/models/question.dart';

class QuestionsController extends GetxController {
  final RxBool _hasLoaded = false.obs;

  final RxBool _show = false.obs;
  final RxInt _questionIdx = 0.obs;

  final RxInt _selectedDeckIdx = 0.obs;
  final RxList<QuestionDeck> _questionDecks = <QuestionDeck>[].obs;

  QuestionDeck get _currentDeck => _questionDecks[_selectedDeckIdx.value];

  List<QuestionDeck> get questionDecks => _questionDecks;
  bool get show => _show.value;
  bool get hasLoaded => _hasLoaded.value;
  int get selectedDeckIdx => _selectedDeckIdx.value;

  QuestionsController() {
    fetchDecks();
  }

  Future<void> fetchDecks() async {
    final CollectionReference<QuestionDeck> deckRef = FirebaseFirestore.instance
        .collection('learning')
        .withConverter<QuestionDeck>(
            fromFirestore: (snapshot, _) =>
                QuestionDeck.fromJson(snapshot.data()!),
            toFirestore: (model, _) => {});
    QuerySnapshot<QuestionDeck> snapshot = await deckRef.get();
    List<QuestionDeck> decks = snapshot.docs.map((e) => e.data()).toList();

    _hasLoaded.value = true;
    decks[_selectedDeckIdx.value].questions.shuffle();
    _questionDecks.assignAll(decks);
    update();
  }

  void selectDeck(int idx) {
    if (idx < questionDecks.length && idx >= 0) {
      _questionDecks[idx].questions.shuffle();
      _selectedDeckIdx.value = idx;
      _questionIdx.value = 0;
      _show.value = false;
      update();
    }
  }

  bool hasNext() {
    return (_questionIdx.value + 1 < _currentDeck.questions.length);
  }

  bool hasPrev() {
    return (_questionIdx.value - 1 >= 0 &&
        _questionIdx.value - 1 < _currentDeck.questions.length);
  }

  void updateToNext() {
    if (hasNext()) {
      _questionIdx.value += 1;
      _show.value = false;
      update();
    }
  }

  void updateToPrev() {
    if (hasPrev()) {
      _questionIdx.value -= 1;
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
    return questionDecks[_selectedDeckIdx.value].questions[_questionIdx.value];
  }
}
