import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {

  User _user;

  String uid;
  String name;
  String surname;
  DocumentReference ref;
  String email;
  Timestamp dateSubcribe;

  User(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    uid = snapshot.documentID;
    Map<String, dynamic> map = snapshot.data;
    uid = map["uid"];
    name = map["name"];
    surname = map["surname"];
    email=map["email"];
    dateSubcribe=map["dateSubcribe"];
  }



  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "surname": surname,
      "email": email,
      "dateSubcribe": dateSubcribe,
    };
  }
} 