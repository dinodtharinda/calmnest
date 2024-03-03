import 'package:calmnest/data/repository/question_repo.dart';
import 'package:flutter/material.dart';

class QuestoinController extends ChangeNotifier {
  final QuestionRepo questionRepo;
  Map<String, String> answers = {
    'q1': '',
    'q2': '',
    'q3': '',
    'q4': '',
  };

  Map<String, List<String>> answerss = {
    'What is the primary mental health concern you are seeking support for?': ['Depression','Bipolar Disorder','Anxiety'],
    'q2': [],
    'q3': [],
    'q4': [],
  };

  QuestoinController({required this.questionRepo});

  void updateAnswers(String key, String answer) {
    answers.update(key, (value) => value = answer);
    print(answer);
  }

  void sendAnswers() {
    questionRepo.sendAnswers(answers);
  }
}
