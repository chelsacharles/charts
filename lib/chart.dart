import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
 
class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo() : super();
 
  final String title = "Charts Demo";
 
  @override
  ChartsDemoState createState() => ChartsDemoState();
}
 
class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;
   List<charts.Series> seriesList1;
   List<charts.Series> seriesLineData;

  static List<charts.Series<Sales, String>> _createRandomData() {
 
    final desktopSalesData = [
      Sales('Income', 20),
      Sales('Expense', 70),
      
    ];
 
   
 
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return (sales.year== 'Income')?charts.MaterialPalette.blue.shadeDefault:charts.MaterialPalette.pink.shadeDefault;
        },
       
      ),
     
    ];
  }
  static List<charts.Series<Sales, String>> _createRandomData1() {
 
    final desktopSalesData1 = [
      Sales('Entertainment', 70),
      Sales('Travel', 50),
       Sales('Fees', 40),
      Sales('Food', 20),
      
    ];
 
   
 
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData1,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.pink.shadeDefault;
        },
      ),
     
    ];
  }
   static List<charts.Series<Sales1, int>> _createRandomData2() {
 
    var linesalesdata = [
      new Sales1(0, 45),
      new Sales1(1, 56),
      new Sales1(2, 55),
      new Sales1(3, 60),
      new Sales1(4, 61),
      new Sales1(5, 70),
    ];
 
   
 
    return [
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales1 sales, _) => sales.yearval,
        measureFn: (Sales1 sales, _) => sales.salesval,
      ),
     
    ];
  }
  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 0.5,
      ),
     domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.white,
                  ),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
    );
  }
   barChart1() {
    return charts.BarChart(
      seriesList1,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 0.5,
      ),
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.white,
                  ),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 0, // size in Pts.
                  color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
    );
  }
  linechart()
  {
    return charts.LineChart(
                            seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: false, stacked: false, includePoints: true),
                            animate: true,
                            animationDuration: Duration(seconds: 0),
                             primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 18, // size in Pts.
                  color: charts.MaterialPalette.white),

              // Change the line colors to match text color.
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white)))
      //                       behaviors: [
      //   new charts.ChartTitle('Years',
      //       behaviorPosition: charts.BehaviorPosition.bottom,
      //       titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
      //   new charts.ChartTitle('Sales',
      //       behaviorPosition: charts.BehaviorPosition.start,
      //       titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
      //   new charts.ChartTitle('Departments',
      //       behaviorPosition: charts.BehaviorPosition.end,
      //       titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
      //       )   
      // ]
                          );

  }
 
  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
    seriesList1 = _createRandomData1();
  seriesLineData = _createRandomData2();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Container (child: Padding(
       padding: EdgeInsets.all(7),
       child: Stack(children: <Widget>[
         Align(
           alignment: Alignment.centerRight,
           child: Stack(
             children: <Widget>[
               Padding(
               padding: EdgeInsets.fromLTRB(20, 20, 20, 350),
               child:  barChart(),),Padding(
               padding: EdgeInsets.fromLTRB(20, 200, 20, 180),
               child:  linechart(),),
               Padding(
               padding: EdgeInsets.fromLTRB(20, 350, 20, 20),
               child:  barChart1(),),
               ]))])))
      // Container(
      //   padding: EdgeInsets.fromLTRB(20, 20, 20, 350),
      //   child: barChart(),
        
      // ),
    );
  }
}
 
class Sales {
  final String year;
  final int sales;
 
  Sales(this.year, this.sales);
}

class Sales1 {
  final int yearval;
  final int salesval;
 
  Sales1(this.yearval, this.salesval);
}