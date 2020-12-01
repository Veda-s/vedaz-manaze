import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test01/oldie/group_list.dart';

//void main() => runApp(MyApp());
//void main() => runApp(HomeScreen());
void main() => runApp(GroupList());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baby Names',
        //home: MyHomePage(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            elevation: 0,
            title: Icon(
              Icons.linear_scale,
              size: 50,
              //color: Colors.deepOrange,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: new BottomAppBar(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.menu,
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
            onPressed: () => {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240.0,
                color: Colors.deepOrange,
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
                                circularStrokeCap: CircularStrokeCap.round,
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
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 50.0,
                                                  child: Card(
                                                      color: Colors.white,
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
                                                      color: Colors.white,
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
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
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
                                                    dummyStudentList.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 36,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.deepOrange),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: Card(
                                          color: Colors.deepOrangeAccent,
                                          elevation: 10.0,
                                          child: Center(
                                              child: Text('lorem.',
                                                  style: TextStyle(
                                                      color: Colors.white)))),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 50.0,
                                      child: Card(
                                          color: Colors.deepOrangeAccent,
                                          elevation: 10.0,
                                          child: Center(
                                              child: Text('lorem.',
                                                  style: TextStyle(
                                                      color: Colors.white)))),
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
              Expanded(
                child: Container(
                  color: Colors.deepOrange,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(55)),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 40, right: 16, bottom: 0),
                        child: ListView.builder(
                          itemCount: dummyStudentList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5.0,
                              shadowColor: Colors.white,
                              color: Colors.white,
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          right: new BorderSide(
                                              width: 1.0,
                                              color: Colors.black87))),
                                  child: Icon(Icons.account_box,
                                      color: Colors.black),
                                ),
                                title: Text(
                                  dummyStudentList[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                trailing: Icon(
                                  Icons.ac_unit,
                                  color: Colors.deepOrange,
                                ),
                                onTap: () => {},
                                visualDensity: VisualDensity.compact,
                                subtitle: Row(
                                  children: <Widget>[
                                    Icon(Icons.linear_scale,
                                        color: Colors.deepOrangeAccent),
                                    Text(" Intermediate",
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                                selected: false,
                                enabled: false,
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                //contentPadding: EdgeInsets.only(top:0,bottom:0),
                                //shape: ShapeBorder.lerp(a, b, t),
                                //shape: ,
                                //contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, dummySnapshot);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}

class CustomClipperImage extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(55, size.height / 1.4);
    var firstEndPoint = Offset(size.width / 1.7, size.height / 1.3);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (35), size.height - 95);
    var secondEndPoint = Offset(size.width, size.height / 2.4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

final dummyGroupDoc = {
  'name': 'NM1102D',
  'createdOn': 'date',
  'lastUpdatedOn': 'date_',
  'students': [
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Kushagr Juneja',
    'Prateek Rathi',
    'Naveen Singh',
    'Narak Swami',
    'Thekedar Ka'
  ],
};

final List<String> dummyStudentList = dummyGroupDoc['students'];

final dummySnapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {
    "name": "Justin",
    "votes": ['a', 'b', 'c']
  },
];
