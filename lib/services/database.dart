import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_note/models/noteModel.dart';
import 'package:flutter_note/models/notifyModel.dart';
import 'package:flutter_note/models/projectModel.dart';
import 'package:flutter_note/models/user.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userCollection = "users";
  final String noteCollection = "notes";
  final String notifyCollection = "notify";

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(user.id)
          .set({"id": user.id, "name": user.name, "email": user.email});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(userCollection).doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addNote(String uid, String title, String body) async {
    try {
      var uuid = Uuid().v4();
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(uuid)
          .set({
        "id": uuid,
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> updateNote(
      String uid, String title, String body, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .update({
        "title": title,
        "body": body,
        "creationDate": Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> delete(String uid, String id) async {
    try {
      await _firestore
          .collection(userCollection)
          .doc(uid)
          .collection(noteCollection)
          .doc(id)
          .delete();
    } catch (e) {
      print(e.message);
    }
  }

  Stream<List<NoteModel>> noteStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(noteCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NoteModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(NoteModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<NotifyModel>> notifyStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(notifyCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NotifyModel> retVal1 = [];
      query.docs.forEach((element) {
        retVal1.add(NotifyModel.fromDocumentSnapshot(element));
      });
      print(retVal1);
      return retVal1;
    });
  }

  Stream<List<ProjectModel>> projectStream(String uid) {
    return _firestore
        .collection(userCollection)
        .doc(uid)
        .collection(notifyCollection)
        .orderBy("creationDate", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProjectModel> retVal1 = [];
      query.docs.forEach((element) {
        retVal1.add(ProjectModel.fromDocumentSnapshot(element));
      });
      print(retVal1);
      return retVal1;
    });
  }
}
