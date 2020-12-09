import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/views/dashboard.dart';
import 'package:test01/views/dashboard.dart';



import 'models.dart';
import 'views/views.dart';
import 'services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './utils.dart';

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

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AttendanceModel()),
    ],
    child: CoreApp(),
  ));
}

class CoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Vedaz Manaze',
        //home: MarkAttendanceBody(
        //  group: 'A2IQlTxWyZ3Y7LqSJTq0',
        // ),
        //home: AttendanceBody(
        //group: 'testgroup01',
        // date: '2020-11-09',
        //),
        //home: Marks(),
        //home: MarksBody(
        //group: 'A2IQlTxWyZ3Y7LqSJTq0', subject: 'MAT', date: '2020-11-20'),
        //home: MarksBody(
        //group: 'A2IQlTxWyZ3Y7LqSJTq0', subject: 'PHY', date: '2020-11-22'),
        //home: SuccesfulMessage(),
        //home: UnSuccesfulMessage(),
        //home: GroupBody(docId:'A2IQlTxWyZ3Y7LqSJTq0'),
        //home: AddGroupView(),
        home: HomePage(),
      //home:TestRecordList(group: 'testgroup06',subject: 'PHY',),
      //home:DashBoard('testgroup06','PHY',6756),
        //home: SignIn(),
        //home:PointsLineChart.withSampleData()
        //home : DateTimeComboLinePointChart.withSampleData()
        //home: DashBoard()
        //home: MyHomePage()
    );
  }
}

class SignIn extends StatelessWidget {
  final email = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: new FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        icon: Icon(Icons.lock_open),
        label: Text('Sign In'),
        onPressed: () async {
          try {
            auth
                .signInWithEmailAndPassword(
                    email: email.text, password: passwd.text)
                .then((value) {
              if (value != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }
            }).catchError((onError) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UnSuccesfulMessage()),
              );
            });
          } on AuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Icon(
              Icons.local_play,
              size: 50,
            ),

            backgroundColor: Colors.white,
            floating: true,
            pinned: true, //flexibleSpace: Placeholder(),
            expandedHeight: 350,
            flexibleSpace: Stack(
              children: <Widget>[
                Center(
                    child: Container(
                        child: ImageBanner('assets/images/veda.jpeg'))),
/*                         Container(
                          width: double.infinity,
                          height: 240.0,
                          //color: hfghfg@hgail.comColors.deepOrange,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 1.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircularPercentIndicator(
                                          radius: 100.0,
                                          lineWidth: 13.0,
                                          animation: true,
                                          percent: 0.8,
                                          backgroundColor: Colors.white70,
                                          arcType: ArcType.FULL,
                                          arcBackgroundColor: Colors.black,
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.deepOrange,
                                          center: Text("",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepOrange)),
                                          //footer: Text("Present",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            height: 150.0,
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 50.0,
                                                            child: Card(
                                                                color: Colors
                                                                    .white,
                                                                elevation: 10.0,
                                                                child: Center(
                                                                    child: Text(
                                                                        'lorem.',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white)))),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 50.0,
                                                            child: Card(
                                                                color: Colors
                                                                    .white,
                                                                elevation: 10.0,
                                                                child: Center(
                                                                    child: Text(
                                                                        'lorem.',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white)))),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Container(
                                                      height: 145.0,
                                                      width: 40.0,
                                                      child: Card(
                                                        color: Colors.white,
                                                        elevation: 10.0,
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                              '11',
                                                              style: TextStyle(
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .deepOrange),
                                                            )),
                                                            Icon(
                                                              Icons
                                                                  .line_style_outlined,
                                                              size: 50,
                                                              color: Colors
                                                                  .deepOrange,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 50.0,
                                                child: Card(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    elevation: 10.0,
                                                    child: Center(
                                                        child: Text('lorem.',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)))),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: 50.0,
                                                child: Card(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    elevation: 10.0,
                                                    child: Center(
                                                        child: Text('lorem.',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                       */
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwd,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
