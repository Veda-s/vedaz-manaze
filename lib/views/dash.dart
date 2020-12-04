/* /// Line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:test01/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PointsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  //final rollNo;

  PointsLineChart(this.seriesList, {this.animate});
  //PointsLineChart(this.rollNo, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory PointsLineChart.withSampleData() {
    return new PointsLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  final TestService testService = TestService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: testService.getAllMarks('A2IQlTxWyZ3Y7LqSJTq0', 'PHY'),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
/*           List<LinearSales> list1;
          List<charts.Series<LinearSales, int>> list2;


          List<Map<String,int>> l;
          snapshot.data.documents.forEach((element) {
            Map<String,int> m;

            m['date'] = int.parse(element.documentID);
            m['total'] = element.data['total'];

            element.data['obtained'].forEach((e){
              m[e['roll_no'].toString()] = int.parse(e['marks']);

            });
            l.add(m);
          });

          l.forEach((element) {
            //list1.add((element[rollNo]/element['total']) * 100)
          });
 */

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Icon(Icons.whatshot, color: Colors.black),
            ),
            //body: Text(snapshot.data.documents[0].data.toString())
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
                child: Container(
                  child: new charts.LineChart(seriesList,
                      behaviors: [new charts.PanAndZoomBehavior()],
                      animate: animate,
                      defaultRenderer:
                          new charts.LineRendererConfig(includePoints: true)),
                ),
              ),
            ),
          );
        });
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
      new LinearSales(4, 75),
      new LinearSales(5, 75),
      new LinearSales(6, 75),
      new LinearSales(7, 75),
      new LinearSales(8, 175),
      new LinearSales(9, 735),
      new LinearSales(10, 275),
      new LinearSales(11, 575),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final double sales;

  LinearSales(this.year, this.sales);
}



 */
