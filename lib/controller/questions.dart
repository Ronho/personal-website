import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import 'package:sembast_web/sembast_web.dart';

import 'package:personal_website/models/question.dart';

enum Difficulty { easy, medium, hard }

// Time in minutes that has to pass until a question is shown again.
final Map<Difficulty, int> timeDifference = {
  Difficulty.easy: 10080, // 7 days
  Difficulty.medium: 4320, // 3 days
  Difficulty.hard: 1440, // 1 day
};

class QuestionDBEntry {
  String id;
  String questionDeckName;
  DateTime lastAnswered;
  Difficulty difficulty;

  QuestionDBEntry({
    required this.id,
    required this.questionDeckName,
    required this.lastAnswered,
    required this.difficulty,
  });

  bool stillValid(DateTime currentDateTime) {
    return currentDateTime.difference(lastAnswered).inMinutes <
        timeDifference[difficulty]!;
  }

  factory QuestionDBEntry.fromJson(Map<dynamic, dynamic> json) {
    return QuestionDBEntry(
      id: json['id'].toString(),
      questionDeckName: json['questionDeckName'].toString(),
      lastAnswered: DateTime.parse(json['lastAnswered'].toString()),
      difficulty: Difficulty.values[json['difficulty']],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'questionDeckName': questionDeckName,
      'lastAnswered': lastAnswered.toIso8601String(),
      'difficulty': difficulty.index,
    };
  }
}

class QuestionsController extends GetxController {
  final RxBool _hasLoaded = false.obs;

  final RxBool _show = false.obs;

  final RxInt _selectedDeckIdx = 0.obs;
  final RxList<QuestionDeck> _questionDecks = <QuestionDeck>[].obs;
  final RxList<Question> _availableQuestions = <Question>[].obs;

  List<QuestionDeck> get questionDecks => _questionDecks;
  bool get show => _show.value;
  bool get hasLoaded => _hasLoaded.value;
  int get selectedDeckIdx => _selectedDeckIdx.value;

  // Database
  static const String dbKey = 'questions';
  final StoreRef store = stringMapStoreFactory.store();
  final DatabaseFactory factory = databaseFactoryWeb;
  late final Database db;

  QuestionsController() {
    factory.openDatabase('spaced-repetition').then((value) {
      db = value;
      fetchDecks();
    });
  }

  Future<void> fetchDecks() async {
    // Load data from firestore.
    final CollectionReference<QuestionDeck> deckRef = FirebaseFirestore.instance
        .collection('learning')
        .withConverter<QuestionDeck>(
            fromFirestore: (snapshot, _) =>
                QuestionDeck.fromJson(snapshot.data()!),
            toFirestore: (model, _) => {});
    QuerySnapshot<QuestionDeck> snapshot = await deckRef.get();
    List<QuestionDeck> decks = snapshot.docs.map((e) => e.data()).toList();

    // Assumption that at least one deck exists.
    List<Question> questions = await _selectDeck(selectedDeckIdx, decks);

    _hasLoaded.value = true;
    _questionDecks.assignAll(decks);
    _availableQuestions.assignAll(questions);
    update();
  }

  Future<List<QuestionDBEntry>> _getTakenQuestions() async {
    var record = await store.record(dbKey).get(db);
    if (record != null) {
      List clone = cloneList(record as List);
      List<QuestionDBEntry> takenQuestions =
          clone.map((e) => QuestionDBEntry.fromJson(e)).toList();
      takenQuestions =
          takenQuestions.where((e) => e.stillValid(DateTime.now())).toList();
      return takenQuestions;
    } else {
      return [];
    }
  }

  void _storeTakenQuestions(Iterable<QuestionDBEntry> takenQuestions) async {
    await store
        .record(dbKey)
        .put(db, takenQuestions.map((e) => e.toJson()).toList());
  }

  Future<List<Question>> _selectDeck(int idx, List<QuestionDeck> decks) async {
    if (idx < decks.length && idx >= 0) {
      QuestionDeck selectedDeck = decks[idx];
      List<Question> availableQuestions = selectedDeck.questions;

      Iterable<QuestionDBEntry> takenQuestions = await _getTakenQuestions();
      _storeTakenQuestions(takenQuestions);

      availableQuestions = availableQuestions
          .where((e) => !takenQuestions.any(
              (q) => q.id == e.id && q.questionDeckName == selectedDeck.name))
          .toList();
      availableQuestions.shuffle();
      return availableQuestions;
    } else {
      return [];
    }
  }

  void selectDeck(int idx) async {
    if (idx < questionDecks.length && idx >= 0) {
      List<Question> questions = await _selectDeck(idx, questionDecks);

      _selectedDeckIdx.value = idx;
      _availableQuestions.assignAll(questions);
      _show.value = false;
      update();
    }
  }

  void updateToNext(Difficulty difficulty) async {
    if (_availableQuestions.isNotEmpty) {
      Question currentQuestion = _availableQuestions[0];
      QuestionDBEntry newEntry = QuestionDBEntry(
          id: currentQuestion.id,
          questionDeckName: questionDecks[selectedDeckIdx].name,
          difficulty: difficulty,
          lastAnswered: DateTime.now());
      List<QuestionDBEntry> takenQuestions =
          (await _getTakenQuestions()).toList();
      takenQuestions.add(newEntry);
      _storeTakenQuestions(takenQuestions);

      _availableQuestions.removeAt(0);
      _show.value = false;
      update();
    }
  }

  void showTrue() {
    _show.value = true;
    update();
  }

  Question? getQuestion() {
    if (_availableQuestions.isNotEmpty) {
      return _availableQuestions[0];
    }
    return null;
  }
}
