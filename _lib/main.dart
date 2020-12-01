import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test01/models.dart';
import 'package:test01/views/_group.dart';
import 'package:test01/views/student.dart';
import 'auth.dart';
import 'db.dart';

void main() {
  runApp(SelfishApp());
}
class SelfishApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        //body: StudentView(documentid: 'HwRVDEL1Fg40Dig9xMPp',),
        //body: GroupView(documentId: 'A2IQlTxWyZ3Y7LqSJTq0',),
        body: StudentCreateWalaView(),
      ),
    );
  }
}
class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user),
        StreamProvider<Student>.value(
            value: DataService().streamStudent('HwRVDEL1Fg40Dig9xMPp')),
/*         StreamProvider<Group>.value(
            value: DataService().streamGroup('HwRVDEL1Fg40Dig9xMPp')), */
        // See implementation details in next sections

        //StreamProvider<Group>.value(value: null)
        //StreamProvider<Student>.value(value: null)
        //StreamProvider<AttendanceRecord>.value(value: null)
        //StreamProvider<MarksRecord>.value(value: null)
      ],
      child: TheApp(),
    );
  }
}

class TheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'It\'s thhe title',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final db = DataService();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Student data = Provider.of<Student>(context);
    return Scaffold(
/*       appBar: AppBar(
        title: Text('The App'),
        elevation: 30.0,
        backgroundColor: Colors.blueAccent,

      ), */
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2.0),
            child: Container(
              height: 45.0,
              color: Colors.deepOrange,
              padding: EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    'The App',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(data.name['first']),
        Text(data.name['middle']),
        Text(data.name['last']),
        Text(data.regNo),
        Text(data.rollNo),
        Text(data.about['last_score']),
        Text(data.about['past_insti']),
/*         T)ext('Gorup Name'),
        Text('Created On'),
        Text('Updated On'),
        Divider(),
        Text('Student'),
        Text('Student'),
        Text('Student'),
        Text('Student'), */
      ]),
    );
  }
}
