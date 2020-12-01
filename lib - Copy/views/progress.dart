import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:test01/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';










class ProgressChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  factory ProgressChart.withSampleData() {
    return ProgressChart(
      _createSampleData(),
      animate: true,
    );
  }

  ProgressChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: charts.TimeSeriesChart(
          seriesList,
          animate: animate,
          behaviors: [
            new charts.SlidingViewport(),
            new charts.PanAndZoomBehavior(),
            //new charts.InitialHintBehavior(maxHintTranslate: 4.0),
            //charts.PanBehavior(),
            new charts.LinePointHighlighter(
              defaultRadiusPx: 10.0,
              dashPattern: [4, 9],
              showHorizontalFollowLine:
                  charts.LinePointHighlighterFollowLineType.nearest,
              showVerticalFollowLine:
                  charts.LinePointHighlighterFollowLineType.nearest,
            ),

            new charts.ChartTitle('PHY',
                subTitle: 'Progress',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.start,
                // Set a larger inner padding than the default (10) to avoid
                // rendering the text too close to the top measure axis tick label.
                // The top tick label may extend upwards into the top margin region
                // if it is located at the top of the draw area.
                innerPadding: 18),
            new charts.ChartTitle('Date',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
            new charts.ChartTitle('% Obtained',
                behaviorPosition: charts.BehaviorPosition.start,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
/*             new charts.ChartTitle('End title',
                behaviorPosition: charts.BehaviorPosition.end,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea), */
            new charts.RangeAnnotation([
              new charts.RangeAnnotationSegment(
                  0, 33.5, charts.RangeAnnotationAxisType.measure,
                  startLabel: 'Poor',
                  //endLabel: 'Poor',
                  color: charts.MaterialPalette.deepOrange.shadeDefault),
              new charts.RangeAnnotationSegment(
                  33.5, 65, charts.RangeAnnotationAxisType.measure,
                  startLabel: 'Mediocre',
                  //endLabel: 'Mediocre',
                  color: charts.MaterialPalette.gray.shade200),
              new charts.RangeAnnotationSegment(
                  65, 90, charts.RangeAnnotationAxisType.measure,
                  startLabel: 'Good',
                  //endLabel: 'Good',
                  color: charts.MaterialPalette.lime.shadeDefault),
              new charts.RangeAnnotationSegment(
                  90, 100, charts.RangeAnnotationAxisType.measure,
                  startLabel: 'Excellent',
                  //endLabel: 'Excellent',
                  color: charts.MaterialPalette.green.shadeDefault),
/*               new charts.LineAnnotationSegment(
                  40, charts.RangeAnnotationAxisType.measure,
                  color: charts.MaterialPalette.black), */
            ]),
          ],
          // Configure the default renderer as a line renderer. This will be used
          // for any series that does not define a rendererIdKey.
          //
          // This is the default configuration, but is shown here for  illustration.
          defaultRenderer: new charts.LineRendererConfig(
              includePoints: true,
              includeLine: true,
              radiusPx: 3,
              includeArea: true),
          // Custom renderer configuration for the point series.
          customSeriesRenderers: [
            new charts.PointRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customPoint',
            )
          ],
          // Optionally pass in a [DateTimeFactory] used by the chart. The factory
          // should create the same type of [DateTime] as the data provided. If none
          // specified, the default creates local date time.
          dateTimeFactory: const charts.LocalDateTimeFactory(),
/*           primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
                new charts.BasicNumericTickProviderSpec(desiredTickCount: 2)),
          domainAxis: charts.DateTimeAxisSpec(
            tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(month: charts.TimeFormatterSpec())), */
          /*      domainAxis: charts.DateTimeAxisSpec(
              tickProviderSpec: charts.DayTickProviderSpec(increments: [7])), */
        ),
      ),
    );
  }

  static List<charts.Series<ProgressRecord, DateTime>> _createSampleData() {
    final recordList = [
      ProgressRecord(DateTime(2020, 9, 19), 80),
      ProgressRecord(DateTime(2020, 9, 30), 30),
      ProgressRecord(DateTime(2020, 10, 2), 66),
      ProgressRecord(DateTime(2020, 10, 13), 77),
      ProgressRecord(DateTime(2020, 10, 21), 33),
      ProgressRecord(DateTime(2020, 10, 26), 60),
      ProgressRecord(DateTime(2020, 11, 19), 97),
      ProgressRecord(DateTime(2020, 11, 30), 80),
    ];

    return [
      charts.Series<ProgressRecord, DateTime>(
          id: 'Progess',
          colorFn: (_, __) => charts.MaterialPalette.white,
          domainFn: (ProgressRecord obtained, _) => obtained.time,
          measureFn: (ProgressRecord obtained, _) => obtained.obtained,
          measureLowerBoundFn: (ProgressRecord obtained, _) =>
              obtained.obtained - 0.5,
          measureUpperBoundFn: (ProgressRecord obtained, _) =>
              obtained.obtained + 0.5,
          data: recordList),
    ];
  }
}

class ProgressRecord {
  final DateTime time;
  final double obtained;

  ProgressRecord(this.time, this.obtained);
}
