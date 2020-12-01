import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models.dart';
import 'package:test01/services/services.dart';
import './views.dart';

import '../utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

FirebaseAuth auth = FirebaseAuth.instance;

class HomePage extends StatelessWidget {
  void reg() async {
    try {
      AuthResult userCredential = await auth.createUserWithEmailAndPassword(
          email: "barry.allen@example.com", password: "SuperSecretPassword!");
    } on AuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void sig() async {
    try {
      AuthResult userCredential = await auth.signInWithEmailAndPassword(
          email: "barry.allen@example.com", password: "SuperSecretPassword!");


    } on AuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference meta = Firestore.instance.collection('meta');
    return FutureBuilder<DocumentSnapshot>(
      future: meta.document('summary').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return Scaffold(
                bottomNavigationBar: new BottomAppBar(
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          try {
                            AuthResult userCredential =
                                await auth.signInWithEmailAndPassword(
                                    email: "barry.allen@example.com",
                                    password: "SuperSecretPassword!");

                            if (userCredential != null) {
                              print(userCredential.toString());
                            }
                          } on AuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        icon: Icon(
                          Icons.flash_on,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: new FloatingActionButton.extended(
                  backgroundColor: Colors.deepOrange,
                  icon: Icon(Icons.add),
                  label: Text('Add New'),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddGroupView()),
                    )
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                body: CustomScrollView(slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Icon(
                      Icons.local_play,
                      size: 50,
                    ),

                    backgroundColor: Colors.white,

                    floating: true,
                    //flexibleSpace: Placeholder(),
                    expandedHeight: 350,
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title:
                              Text(snapshot.data.data['groups'][index]['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                          trailing:
                              Icon(Icons.arrow_right, color: Colors.deepOrange),
                          onTap: () {
                            print(snapshot.data.data['groups'][index]['path']);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GroupBody(
                                      docId: snapshot
                                          .data.data['groups'][index]['path']
                                          .toString())),
                            );
                          },
                        ),
                      ),
                    ),
                    childCount: snapshot.data.data['groups'].length,
                  ))
                ]));
          }
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
