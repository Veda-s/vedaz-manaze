import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test01/services/services.dart';
import 'package:test01/views/progress.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashTile extends StatelessWidget {
  final seriesList;

  DashTile({this.seriesList});
  @override
  Widget build(BuildContext context) {
    //return Container(height: 550, child: ProgressChart.withSampleData());
    return Container(height: 450, child: ProgressChart(seriesList));
  }
}

class DashBoard extends StatelessWidget {
  final List snap = [{}, {}];
  final Map doc = {};
  final int tot = 100;
  final List<int> obtL = [];
  final int obt = 45;
  final double per = 45;

  final int roll;
  final group;
  final subject;
  final List<ProgressRecord> record = [];

  DashBoard(this.group,this.subject,this.roll);

  @override
  Widget build(BuildContext context) {
    TestService testService = TestService();

    return StreamBuilder<QuerySnapshot>(
        //stream: testService.getAllMarks('testgroup06', 'PHY'),
        stream: testService.getAllMarks(group, subject),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if(snapshot.connectionState == ConnectionState.active){
              print('no. of docs' + snapshot.data.documents.length.toString());
              snapshot.data.documents.forEach((ele) {
                record.add(ProgressRecord(
                    DateTime(int.parse(ele['year']), int.parse(ele['month']), int.parse(ele['day'])),
                    ((int.parse(ele['record'][roll.toString()]) / int.parse(ele['total'])) * 100)));
              });

              final chartRecord = [
                charts.Series<ProgressRecord, DateTime>(
                    id: 'Progess',
                    colorFn: (_, __) => charts.MaterialPalette.black,
                    domainFn: (ProgressRecord obtained, _) => obtained.time,
                    measureFn: (ProgressRecord obtained, _) => obtained.obtained,
                    measureLowerBoundFn: (ProgressRecord obtained, _) =>
                    obtained.obtained - 0.5,
                    measureUpperBoundFn: (ProgressRecord obtained, _) =>
                    obtained.obtained + 0.5,
                    data: record),
              ];

              print(record.length);

              return Scaffold(
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text(
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text('DashBoard'),
                      ),
                      ListTile(
                        title: Text('Physics'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(group, 'PHY', roll)));
                        },
                      ),
                      ListTile(
                        title: Text('Mathematics'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(group, 'MAT', roll)));
                        },
                      ),
                      ListTile(
                        title: Text('Chemistry'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard(group, 'CHE', roll)));
                        },
                      ),
                    ],
                  ),
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 70.0,
                        )
                      ]),
                    ),

                    SliverList(
                      delegate: SliverChildListDelegate([
                        DashTile(
                          seriesList: chartRecord,
                        )
                      ]),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                              (context,index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: ListTile(
                            subtitle: Text(record[index].time.day.toString() + '/' + record[index].time.month.toString() + '/' + record[index].time.year.toString()),
                            title: Text(record[index].obtained.toString() + '%'),
                          ),
                                ),
                              ),
                          childCount: record.length
                      ),
                    ),
                  ],
                ),
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



