import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentView extends StatelessWidget {
  final String documentid;

  StudentView({this.documentid});

  @override
  Widget build(BuildContext context) {
    CollectionReference students = Firestore.instance.collection('students');

    return FutureBuilder<DocumentSnapshot>(
      future: students.document(documentid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          return StudentBody(
            data: data,
          );
        }

        return Center(
            child: CircularProgressIndicator(
          strokeWidth: 16.0,
          backgroundColor: Colors.amber,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
        ));
      },
    );
  }
}

class StudentBody extends StatelessWidget {
  final data;
  StudentBody({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 150.0,
          child: ListTile(
            leading: Icon(Icons.account_box),
            title: Text(data['name']['first']),
            subtitle: Row(
              children: [
                Text(data['name']['middle']),
                Text(data['name']['last'])
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StudentCreateWalaView extends StatefulWidget {
  SCWVState createState() => SCWVState();
}

class SCWVState extends State<StudentCreateWalaView> {
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();

  final program = TextEditingController();
  final group = TextEditingController();
  final rollNo = TextEditingController();
  final regNo = TextEditingController();

  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final gaurdianName = TextEditingController();

  final primaryContact = TextEditingController();
  final secondaryContact = TextEditingController();

  final email = TextEditingController();

  final address = TextEditingController();

  @override
  Widget build(BuildContext context) {
                Map itsAMap = {
              'name' : {
                'first' :  firstName.text,
                'middle' : ''
              }
                };
    return ListView(
      children: [
        TextField(
          controller: firstName,
        ),
        FlatButton(
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(firstName.text),
                    );
                  });
            },
            child: Text('fuck'))
      ],
    );
  }
}

