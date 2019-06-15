import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class TimeSeriesChart extends StatelessWidget {
  const TimeSeriesChart(this.seriesList);
  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;

  @override
  Widget build(BuildContext context) {
       return   new Card(
          color: Colors.white,
          elevation: 2.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          child:charts.TimeSeriesChart(
          seriesList,
          animate: false,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
          domainAxis: charts.DateTimeAxisSpec(
            tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
              day: charts.TimeFormatterSpec(
                format: 'EEE',
                transitionFormat: 'EEE',
              ),
            ),
          ),
          ),
        );
  }

/// Create one series with sample hard coded data.
}

class TimeSeriesSales {
  TimeSeriesSales(this.time, this.sales);

  final DateTime time;
  final int sales;
}