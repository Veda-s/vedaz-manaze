import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class Student {
  final Map name;
  final Map guardianName;
  final Map contact;
  final Map about;

  final String program;
  final String group;
  final String rollNo;
  final String regNo;

  Student(
      {this.name,
      this.guardianName,
      this.contact,
      this.about,
      this.group,
      this.program,
      this.regNo,
      this.rollNo});

  factory Student.fromMap(Map data) {
    data = data ?? {};
    return Student(
        name: data['name'],
        guardianName: data['guardian_name'],
        contact: data['contact'],
        about: data['about'],
        group: data['group'],
        program: data['program'],
        rollNo: data['roll_no'],
        regNo: data['reg_no']);
  }

  factory Student.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Student(
        name: data['name'],
        guardianName: data['guardian_name'],
        contact: data['contact'],
        about: data['about'],
        group: data['group'],
        program: data['program'],
        rollNo: data['roll_no'],
        regNo: data['reg_no']);
  }
}

class Group {
  final String name;
  final String createdOn;
  final String updatedOn;
  final List<Map> students;

  Group({this.name, this.createdOn, this.updatedOn, this.students});

  factory Group.fromMap(Map data) {
    return Group(
        name: data['name'],
        createdOn: data['created_on'],
        updatedOn: data['updated_on'],
        students: data['students']);
  }
}

class MarksRecord {
  final String topic;
  final String date;
  final List<Map> record;
  MarksRecord({this.topic, this.date, this.record});
  factory MarksRecord.fromMap(Map data) {
    return MarksRecord(
        topic: data['topic'], date: data['date'], record: data['record']);
  }
}

class AttendanceModel extends ChangeNotifier {
  final List<String> mainList;
  final List<String> absentList = List<String>();

  int get length => mainList.length;

  AttendanceModel({this.mainList});
}
