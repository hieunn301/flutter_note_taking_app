import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String id;
  String title;
  String body;
  Timestamp creationDate;

  ProjectModel({this.id, this.title, this.body, this.creationDate});

  ProjectModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    title = documentSnapshot['title'];
    body = documentSnapshot["body"];
    creationDate = documentSnapshot["creationDate"];
  }

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json["body"];
    creationDate = json["creationDate"];
  }
}
