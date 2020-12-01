import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupView extends StatelessWidget {
  final String documentId;

  GroupView({this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference groups = Firestore.instance.collection('groups');

    return FutureBuilder<DocumentSnapshot>(
      future: groups.document(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          return GroupBody(
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

class GroupBody extends StatelessWidget {
  final data;
  GroupBody({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(data['name']),
        ),
      ],
    );
  }
}
