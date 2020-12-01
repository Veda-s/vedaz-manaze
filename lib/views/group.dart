import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test01/services/services.dart';
import 'package:test01/views/home.dart';
import 'package:test01/views/views.dart';
import '../utils.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';

class GroupBody extends StatelessWidget {
  final String docId;
  GroupBody({this.docId});

  final GroupService groupService = GroupService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: groupService.getDocument(docId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            if (snapshot.data.data['students'] != null) {
              return Scaffold(
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          child: Text('Drawer Header'),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        ListTile(
                          title: Text('Mark Attendance'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MarkAttendanceBody(
                                          group: docId,
                                        )));
                          },
                        ),
                        ListTile(
                          title: Text('Create Test'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Marks(
                                          group: docId,
                                        )));
                          },
                        ),
                        ListTile(
                          title: Text('Peek Attendance Record'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AttendancePeek(
                                          title: 'yes',
                                          group: docId,
                                        )));
                          },
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.star_border, color: Colors.deepOrange),
                          title: Text('Peek Test Score'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MarksBody(
                                        group: 'A2IQlTxWyZ3Y7LqSJTq0',
                                        subject: 'MAT',
                                        date: '2020-11-08')));
                          },
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                  bottomNavigationBar: new BottomAppBar(
                    color: Colors.white,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            )
                          },
                          icon: Icon(
                            Icons.home,
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
                        MaterialPageRoute(
                            builder: (context) => AddStudentView(
                                  group: docId,
                                )),
                      )
                    },
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endDocked,
                  body: CustomScrollView(slivers: [
                    SliverAppBar(
                      title: Icon(
                        Icons.local_play,
                        size: 50,
                      ),
                      backgroundColor: Colors.white,
                      floating: true,
                      pinned: true,
                      expandedHeight: 300,
                      flexibleSpace: Stack(children: <Widget>[
                        Positioned.fill(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text(
                                    snapshot.data.data['students'][index]
                                        ['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentBody(
                                              docId: snapshot
                                                  .data
                                                  .data['students'][index]
                                                      ['roll_no']
                                                  .toString(),
                                            )),
                                  )
                                },
                              ),
                            ),
                          ),
                          childCount: snapshot.data.data['students'].length,
                        ))
                      ]),
                    )
                  ]));
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: new BottomAppBar(
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          )
                        },
                        icon: Icon(
                          Icons.home,
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
                      MaterialPageRoute(builder: (context) => AddStudentView()),
                    )
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                body: Center(
                  child: Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 50.0,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(Icons.cancel_presentation_rounded,
                                      size: 150.0, color: Colors.redAccent),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text('Oops! Such Empty',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          } else {
            return EmptyPage();
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

class AddGroupView extends StatefulWidget {
  @override
  _AddGroupViewState createState() => _AddGroupViewState();
}

class _AddGroupViewState extends State<AddGroupView> {
  GroupService groupService = GroupService();

  final groupName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        //leading: Icon(Icons.group_add),
        title: Text('Create Group'),
        // elevation: 50.0,
        bottom: PreferredSize(
            child: Icon(
              Icons.linear_scale,
              size: 60.0,
              color: Colors.white,
            ),
            preferredSize: Size.fromHeight(50.0)),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )
              },
              icon: Icon(
                Icons.home,
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
          onPressed: () {
            groupService
                .addGroup(groupName.text, {'name': groupName.text})
                .then((value) => groupService.addGroupToMeta(groupName.text))
                .then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuccesfulMessage()),
                    ))
                .catchError((error) => print("Failed to add user: $error"));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Center(
        child: Container(
          height: 300.0,
          width: 350.0,
          child: Card(
            elevation: 30.0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: groupName,
                  decoration: InputDecoration(
                    icon: Icon(Icons.featured_play_list,
                        color: Colors.deepOrange),
                    labelText: 'Group Name',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Marks extends StatefulWidget {
  final String group;

  Marks({this.group});
  @override
  MarksState createState() => MarksState();
}

class MarksState extends State<Marks> {
  final GroupService groupService = GroupService();
  final TestService testService = TestService();



  @override
  Widget build(BuildContext context) {
    Map<String, TextEditingController> textEditingControllers = {};
    final totalMarksController = TextEditingController();
    final subjectController = TextEditingController();

    var textFields = <Widget>[];
    final Map<String, dynamic> theData = {};
    /* theData['obtained'] = Map<String, dynamic>(); */
    theData['obtained'] = List<Map>();
    theData['record'] = Map();

    return FutureBuilder<DocumentSnapshot>(
        future:
            groupService.getDocument(widget.group ?? 'A2IQlTxWyZ3Y7LqSJTq0'),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            snapshot.data.data['students'].forEach((str) {
              var textEditingController = new TextEditingController();

              textEditingControllers.putIfAbsent(
                  str['roll_no'].toString(), () => textEditingController);

              return textFields.add(Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.add_to_photos),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: str['roll_no'].toString(),
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
              ));
            });
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.flash_on),
                onPressed: () {
                  snapshot.data.data['students'].forEach((str) {
                    print(
                        textEditingControllers[str['roll_no'].toString()].text);

                    theData['total'] = totalMarksController.text;

                    theData['record'][str['roll_no'].toString()] =
                        textEditingControllers[str['roll_no'].toString()].text;

                    theData['obtained'].add({
                      'roll_no': str['roll_no'].toString(),
                      'marks':
                          textEditingControllers[str['roll_no'].toString()].text
                    });
                  });

                  //future to add

                  print(theData.toString());
                  testService
                      .addMark(widget.group ?? 'A2IQlTxWyZ3Y7LqSJTq0',
                          subjectController.text ?? 'PHY', theData)
                      .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccesfulMessage()),
                          ))
                      .catchError(
                          (error) => print("Failed to add user: $error"));
                },
              ),
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                centerTitle: true,
                title: Icon(
                  Icons.linear_scale,
                  size: 50,
                ),
                elevation: 50.0,
              ),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Card(
                              elevation: 10.0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: subjectController,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.featured_play_list),
                                          labelText: 'Subject',
                                          hintText: 'PHY/MAT/CHE'),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Card(
                              elevation: 10.0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      controller: totalMarksController,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.featured_play_list),
                                          labelText: 'Total Marks'),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.linear_scale,
                          size: 50,
                          color: Colors.deepOrangeAccent,
                        ),
                      )
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([...textFields]),
                  ),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 16.0,
            backgroundColor: Colors.amber,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        });
  }
}

class MarkAttendanceBody extends StatefulWidget {
  final group;
  MarkAttendanceBody({this.group});
  @override
  _MarkAttendanceBodyState createState() => _MarkAttendanceBodyState();
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}

class _MarkAttendanceBodyState extends State<MarkAttendanceBody> {
  final GroupService groupService = GroupService();

/*   final List<String> list1 = [];
  final List<String> list3 = []; //present
  final List<String> list2 = []; //absent */

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        //future: groupService.getDocument('A2IQlTxWyZ3Y7LqSJTq0'),
        future: groupService.getDocument(widget.group),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return AttendanceList(snapshot: snapshot, group: widget.group);
            }
/*             snapshot.data.data['students'].forEach((entry) {
              if (!list1.contains(entry['roll_no'].toString())) {
                list1.add(entry['roll_no'].toString());
              }
            });

            list1.forEach((element) {
              if (!list3.contains(element) && !list2.contains(element)) {
                list3.add(element);
              }
            }); */

          }

          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 16.0,
            backgroundColor: Colors.amber,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        });
  }
}

class AttendanceList extends StatefulWidget {
  final snapshot;
  final group;
  AttendanceList({this.snapshot, this.group});
  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  final AttendanceService attendanceService = AttendanceService();

  final List<String> list1 = [];
  final List<String> list3 = []; //present
  final List<String> list2 = []; //absent

/*   static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms() async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod(
          'send', <String, dynamic>{
        "phone": "+919466473477",
        "msg": "Hello! This is a test message."
      }); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  } */

  @override
  Widget build(BuildContext context) {
    widget.snapshot.data.data['students'].forEach((entry) {
      if (!list1.contains(entry['roll_no'].toString())) {
        list1.add(entry['roll_no'].toString());
      }
    });

    list1.forEach((element) {
      if (!list3.contains(element) && !list2.contains(element)) {
        list3.add(element);
      }
    });

    return Scaffold(
/*               appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                centerTitle: true,
                leading: Icon(Icons.group_add),
                title: Icon(
                  Icons.linear_scale,
                  size: 50,
                ),
                elevation: 50.0,
              ), */
        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.deepOrange,
                ),
              ),
              IconButton(
                onPressed: () {
                  /* sendSms(); */
                },
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton.extended(
          backgroundColor: Colors.deepOrange,
          icon: Icon(Icons.send),
          label: Text('Mark'),
          onPressed: () {
            Map<String, dynamic> data = Map<String, dynamic>();

            data['present'] = list3;
            data['absent'] = list2;

            attendanceService.markAttendance(widget.group, data).then((value) {
              var now = new DateTime.now();
              var formatter = new DateFormat('yyyy-MM-dd');
              String date = formatter.format(now);
              String message = "Your ward was absent today on $date";
              List<String> recipents = ["9466473477", "123443215"];

              _sendSMS(message, recipents);
            }).then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SuccesfulMessage())));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 240.0,
                  //color: Colors.deepOrange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
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
                                  percent: list3.length / list1.length,
                                  backgroundColor: Colors.white70,
                                  arcType: ArcType.FULL,
                                  arcBackgroundColor: Colors.black,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.deepOrange,
                                  center: Text("Present",
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50.0,
                                        child: InkWell(
                                          onTap: () => print('yes'),
                                          child: Card(
                                              color: Colors.deepOrangeAccent,
                                              elevation: 10.0,
                                              child: Center(
                                                  child: Text(
                                                      widget.snapshot.data
                                                          .data['name'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .bold)))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    height: 150.0,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
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
                                                      list3.length.toString(),
                                                      style: TextStyle(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepOrange),
                                                    )),
                                                    Expanded(
                                                        child: Text(
                                                      list2.length.toString(),
                                                      style: TextStyle(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
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
                                                      widget
                                                          .snapshot
                                                          .data
                                                          .data['students']
                                                          .length
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .deepOrange),
                                                    )),
                                                    Icon(
                                                      Icons.line_style_outlined,
                                                      size: 50,
                                                      color: Colors.deepOrange,
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
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: 60.0,
                  child: InkWell(
                    onTap: () => print('no'),
                    child: Card(
                        color: Colors.white,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: ListTile(
                            leading: Icon(Icons.date_range,
                                color: Colors.deepOrange),
                            title: Text(
                                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        )),
                  ),
                ),
              ),
            ])),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.local_play,
                            color: Colors.deepOrangeAccent,
                          ),
                          title: Text(
                            'Present',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Card(
                    color: Colors.lightGreen,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        list3[index],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          list2.add(list3[index]);
                          list3.remove(list3[index]);
                        });
                      },
                    ),
                  ),
                ),
              ),
              childCount: list3.length,
            )),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.local_play,
                            color: Colors.deepOrangeAccent,
                          ),
                          title: Text(
                            'Absent',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Card(
                    color: Colors.redAccent,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        list2[index],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState(() {
                          list3.add(list2[index]);
                          list2.remove(list2[index]);
                        });
                      },
                    ),
                  ),
                ),
              ),
              childCount: list2.length,
            )),
          ],
        ));
  }
}

class AttendanceBody extends StatelessWidget {
  final group;
  final date;
  AttendanceBody({this.group, this.date});
  AttendanceService attendanceService = AttendanceService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: attendanceService.getDocument(group, date),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.data != null) {
              return Scaffold(
                  body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Row(
                      children: [
                        Icon(
                          Icons.local_play,
                          size: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(date),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(group,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    backgroundColor: Colors.white,
                    floating: true,
                    pinned: true,
                    //flexibleSpace: Placeholder(),
                    expandedHeight: 300,
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                color: Colors.lightGreen,
                                elevation: 5,
                                child: ListTile(
                                  title: Text(
                                      snapshot.data.data['present'][index]
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                        childCount: snapshot.data.data['present'].length),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                color: Colors.red,
                                elevation: 5,
                                child: ListTile(
                                  title: Text(
                                    snapshot.data.data['absent'][index]
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                        childCount: snapshot.data.data['absent'].length),
                  ),
                ],
              ));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          }

          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 16.0,
            backgroundColor: Colors.amber,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        });
  }
}

class MarksBody extends StatelessWidget {
  final group;
  final subject;
  final date;

  MarksBody({this.group, this.subject, this.date});

  TestService testService = TestService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: testService.getMarks(group, subject, date),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
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
                  expandedHeight: 300,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  ListTile(
                    leading: Icon(Icons.date_range, color: Colors.deepOrange),
                    title: Text(date),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(group,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        trailing: Icon(Icons.local_play),
                        title: Text(subject),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.art_track),
                    title: Text('Total Marks : ' +
                        snapshot.data.data['total'].toString()),
                  ),
                ])),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              title: Text(
                                snapshot.data.data['obtained'][index]['roll_no']
                                        .toString() +
                                    ':',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                        child: Card(
                          color: Colors.deepOrange,
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                                snapshot.data.data['obtained'][index]['marks']
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  ),
                  childCount: snapshot.data.data['obtained'].length,
                )),
              ],
            ),
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

class AttendancePeek extends StatefulWidget {
  AttendancePeek({Key key, this.title, this.group}) : super(key: key);

  final String title;
  final group;

  @override
  _AttendancePeekState createState() => _AttendancePeekState();
}

class _AttendancePeekState extends State<AttendancePeek> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(
                Icons.home,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        icon: Icon(Icons.calendar_today),
        label: Text('Peek'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AttendanceBody(
                    group: widget.group,
                    date: "${selectedDate.toLocal()}".split(' ')[0])),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                height: 100,
                width: 200,
                child: Card(
                    elevation: 10,
                    child: Center(
                        child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )))),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date', style: TextStyle(color: Colors.white)),
              elevation: 10,
              color: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
