import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'TimesSeriesChart.dart';
class Chart extends StatefulWidget {
  const Chart();
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<charts.Series<TimeSeriesSales, DateTime>> seriesList;
  bool animate;
  int length = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createSampleData();
  }
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final List<TimeSeriesSales> data = <TimeSeriesSales>[
      TimeSeriesSales(DateTime(2019, 1, 7), 5),
      TimeSeriesSales(DateTime(2019, 1, 8), 25),
      TimeSeriesSales(DateTime(2019, 1, 9), 100),
      TimeSeriesSales(DateTime(2019, 1, 10), 75),
    ];

    return <charts.Series<TimeSeriesSales, DateTime>>[
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new TimeSeriesChart(_createSampleData());
  }
}