import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models.dart';

class StudentService {
  Future<DocumentSnapshot> getDocument(String docId) {
    CollectionReference students = Firestore.instance.collection('students');

    return students.document(docId).get();
  }

  Future<void> addStudent(String docId, Map<String, dynamic> data) {
    CollectionReference students = Firestore.instance.collection('students');

    return students.document(docId).setData(data);
  }

  Future<void> addStudentToGroup(String docID, String name, String rollNo) {
    CollectionReference groups = Firestore.instance.collection('groups');
    print(docID);
    return groups.document(docID).updateData({
      'students': FieldValue.arrayUnion([
        {'name': name, 'roll_no': rollNo}
      ])
    });
  }
}

class GroupService {
  Future<DocumentSnapshot> getDocument(String docId) {
    CollectionReference groups = Firestore.instance.collection('groups');

    return groups.document(docId).get();
  }

  Future<void> addGroup(String docId, Map<String, dynamic> data) {
    CollectionReference groups = Firestore.instance.collection('groups');

    return groups.document(docId).setData(data);
  }

  Future<void> addGroupToMeta(String name) {
    CollectionReference meta = Firestore.instance.collection('meta');
    return meta.document('summary').updateData({
      'groups': FieldValue.arrayUnion([
        {'name': name, 'path': name}
      ])
    });
  }
}

class TestService {
  Future<DocumentSnapshot> getDocument(
      String group, String subject, String date) {
    CollectionReference tests = Firestore.instance.collection('tests  ');

    return tests.document(group + '::' + subject + '::' + date).get();
  }

  Future<void> addMarks(
      String group, String subject, Map<String, dynamic> data) {
    CollectionReference tests = Firestore.instance.collection('tests');

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);
    print(date);
//DateFormat('yyyy-MM-dd').format(DateTime.now())
    return tests.document(group + '::' + subject + '::' + date).setData(data);
  }

  //---------------new-------------------------//
  Future<DocumentSnapshot> getMarks(String group, String subject, String date) {
    CollectionReference subjectTest = Firestore.instance
        .collection('groups')
        .document(group)
        .collection(subject);

    return subjectTest.document(date).get();
  }

  Future<QuerySnapshot> getAllMarks(String group, String subject) {
    CollectionReference subjectTest = Firestore.instance
        .collection('groups')
        .document(group)
        .collection(subject);

    return subjectTest.getDocuments();
  }

  Future<void> addMark(
      String group, String subject, Map<String, dynamic> data) {
    CollectionReference subjectTest = Firestore.instance
        .collection('groups')
        .document(group)
        .collection(subject);

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);
    print(date);

    data['year'] = DateFormat('yyyy').format(now);
    data['month'] = DateFormat('MM').format(now);
    data['day'] = DateFormat('dd').format(now);

    return subjectTest.document(date).setData(data);
  }
}

class AttendanceService {
  Future<DocumentSnapshot> getDocument(String group, String date) {
    CollectionReference attendances = Firestore.instance
        .collection('groups')
        .document(group)
        .collection('attendance');

    return attendances.document(date).get();
  }

  Future<void> markAttendance(String group, Map data) {
    CollectionReference attendances = Firestore.instance
        .collection('groups')
        .document(group)
        .collection('attendance');

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    return attendances.document(date).setData(data);
  }
}
