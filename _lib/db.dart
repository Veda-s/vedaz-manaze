import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'models.dart';

class DataService {
  final Firestore _db = Firestore.instance;

  Stream<Student> streamStudent(String id) {
    return _db
        .collection('students')
        .document(id)
        .snapshots()
        .map((snap) => Student.fromMap(snap.data));
  }

  //Stream<something> method(){}
  //Future<void> method(){}

/*   Future<void> addStudent(){
    
  }

  Future<void> markAttendance(){
    if(_db.collection('students').add({

    })){
      
    }
  } */
}

class DataStore {
  final Firestore _db = Firestore.instance;
}
