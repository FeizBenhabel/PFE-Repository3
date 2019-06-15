import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final List<charts.Series> seriesList=null;
  final bool animate=false;

  LineChart(){
      _createSampleData();
      // Disable animations for image tests.
  }

  /// Creates a [LineChart] with sample data and no transition.
  factory LineChart.withSampleData() {

  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
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
  final int sales;

  LinearSales(this.year, this.sales);
}