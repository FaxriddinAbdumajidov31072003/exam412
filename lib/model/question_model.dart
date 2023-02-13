import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String? question;
  final String? answer;
  final String? id;


  QuestionModel({
    required this.question,
    required this.answer,
    required this.id,

  });

  toJson() {
    return {"question": question, "answer": answer};
  }
  factory QuestionModel.fromJson({Map? data, id}) {
    return QuestionModel(
      question: data?["question"], answer: data?["answer"], id: id,
    );
  }
}