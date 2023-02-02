import 'package:cloud_firestore/cloud_firestore.dart';

class NotifyModel {
  String id;
  String title;
  String body;
  Timestamp creationDate;

  NotifyModel({this.id, this.title, this.body, this.creationDate});

  NotifyModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    title = documentSnapshot['title'];
    body = documentSnapshot["body"];
    creationDate = documentSnapshot["creationDate"];
  }

  NotifyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json["body"];
    creationDate = json["creationDate"];
  }
}
