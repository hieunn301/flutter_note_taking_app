import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String imageUser;

  UserModel({this.id, this.name, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    name = doc["name"];
    email = doc["email"];
    imageUser = doc["imageUser"];
  }
}
