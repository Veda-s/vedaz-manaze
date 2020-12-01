import 'package:flutter/material.dart';
import 'package:test01/views/progress.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 550, child: ProgressChart.withSampleData());
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



    snap.forEach((ele) {
      record.add(ProgressRecord(DateTime(ele['year'], ele['month'], ele['day']),
          ((ele[roll] / ele['total']) * 100)));
    });

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
            delegate:
                SliverChildListDelegate([DashTile(), DashTile(), DashTile()]),
          )
        ],
      ),
    );
  }
}
