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
    return Container(height: 550, child: ProgressChart(seriesList));
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
  final List<ProgressRecord> record = [];

  DashBoard(this.roll);

  @override
  Widget build(BuildContext context) {
    TestService testService = TestService();

    return StreamBuilder<QuerySnapshot>(
        stream: testService.getAllMarks('testgroup06', 'PHY'),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            snapshot.data.documents.forEach((ele) {
              record.add(ProgressRecord(
                  DateTime(int.parse(ele['year']), int.parse(ele['month']), int.parse(ele['day'])),
                  ((int.parse(ele['record'][roll.toString()]) / int.parse(ele['total'])) * 100)));
            });

            print(record[0].toString());

            final chartRecord = [
              charts.Series<ProgressRecord, DateTime>(
                  id: 'Progess',
                  colorFn: (_, __) => charts.MaterialPalette.white,
                  domainFn: (ProgressRecord obtained, _) => obtained.time,
                  measureFn: (ProgressRecord obtained, _) => obtained.obtained,
                  measureLowerBoundFn: (ProgressRecord obtained, _) =>
                      obtained.obtained - 0.5,
                  measureUpperBoundFn: (ProgressRecord obtained, _) =>
                      obtained.obtained + 0.5,
                  data: record),
            ];

            return Scaffold(
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
                  )
                ],
              ),
            );
          }

          return Text('WAIT!');
        });
  }
}
