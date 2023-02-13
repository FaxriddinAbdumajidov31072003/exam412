import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/question_model.dart';
import 'local_store.dart';

class AppController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading = true;
  QuerySnapshot? res;
  List listofquestions = [];
  var question;

  int selectIndex = -1;
  createQuestion({required String question}) async {
    notifyListeners();
    await firestore.collection("Question").add(QuestionModel(
          question: question,
          answer: 'Not Answer !',
          id: '',
        ).toJson());

    notifyListeners();
  }

  createAnswer({
    required String answer,
    required String id,
    required String question,
  }) async {
    ;
    notifyListeners();
    await firestore.collection("Question").doc(id).update(QuestionModel(
          question: question,
          answer: answer,
          id: id,
        ).toJson());

    notifyListeners();
  }

  getQuestioninfirebase() async {
    isLoading;
    notifyListeners();
    var res = await firestore.collection("Question").get();
    listofquestions.clear();
    res.docs.forEach((element) {
      listofquestions
          .add(QuestionModel.fromJson(data: element.data(), id: element.id));
    });
    isLoading = false;
    notifyListeners();
  }

  changeIndex(int index) async {
    if (selectIndex == index) {
      selectIndex = -1;
    } else {
      selectIndex = index;
      notifyListeners();
    }
  }
}
