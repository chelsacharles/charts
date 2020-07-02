/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HorizontalBarChart3 extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final List<String> list1 = ['2014', '2015', '2016', '2017'];
  final List<int> list2 = [5, 25, 100, 75];

  HorizontalBarChart3(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarChart3.withCustomData(customData) {
    print("hello");
    print(customData);
    return new HorizontalBarChart3(
      _createCustomData(customData),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.LineChart(
      seriesList,
       defaultRenderer: new charts.LineRendererConfig(
                                includeArea: false, stacked: false, includePoints: true),
                            animate: true,
                            animationDuration: Duration(seconds: 0),
                             primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white)))
      
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, int>> _createCustomData(customData) {
    // final data = [
    //   new OrdinalSales('2014', 5),
    //   new OrdinalSales('2015', 25),
    //   new OrdinalSales('2016', 100),
    //   new OrdinalSales('2017', 75),
    // ];
    List<OrdinalSales> data=[];
    customData.forEach((d) {
      data.add(new OrdinalSales(d['Day'],d['TotalExpense']));
    });

    return [
      new charts.Series<OrdinalSales, int>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
         fillColorFn: (OrdinalSales sales, _) {
          return charts.MaterialPalette.black;
        },
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final int year;
  final double sales;

  OrdinalSales(this.year, this.sales);
}