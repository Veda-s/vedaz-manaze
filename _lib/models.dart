import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  final String name;
  final String createdOn;
  final String updatedOn;
  final Map<String, String> students;

  Group({this.name, this.createdOn, this.updatedOn, this.students});

  factory Group.fromMap(Map data) {
    data = data ?? {};
    return Group(
        name: data['name'],
        createdOn: data['createdOn'],
        updatedOn: data['updatedOn'],
        students: data['students']);
  }

  factory Group.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Group(
        name: data['name'],
        createdOn: data['createdOn'],
        updatedOn: data['updatedOn'],
        students: data['students']);
  }
}

class Student {
  final Map name;
  final Map gaurdianName;
  final Map contact;
  final Map about;
  final String rollNo;
  final String regNo;

  Student(
      {this.name,
      this.gaurdianName,
      this.contact,
      this.about,
      this.rollNo,
      this.regNo});

  factory Student.fromMap(Map data) {
    data = data ?? {};
    return Student(
        name: data['name'],
        gaurdianName: data['gaurdian_name'],
        contact: data['contact'],
        about: data['about'],
        rollNo: data['roll_no'],
        regNo: data['reg_no']);
  }

  factory Student.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Student(
        name: data['name'],
        gaurdianName: data['gaurdian_name'],
        contact: data['contact'],
        about: data['about'],
        rollNo: data['roll_no'],
        regNo: data['reg_no']);
  }
}
