import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutteranimatedchartsapp/incomeExpChart.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Charts1 extends StatefulWidget {
  Charts1({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts1> {
  var url = 'http://192.168.0.106:8081/tracker/register/TotalExpenseTotalIncomeBar_month?userId=41';
  var isLoading = false;
IncomeExpense customData;
  @override
  void initState() {
    super.initState();
    setState(() {
           isLoading = true;

    });
    getapidetails();
  }
  


  void getapidetails() async {
    var response = await http.get(url);
    customData= IncomeExpense.fromJson(json.decode(response.body));
    print('heyy');
    setState(() {
 isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading? Center(
                child: CircularProgressIndicator(),
              ): HorizontalBarChart1.withCustomData(customData),
            // child: Text("fgfg"),

    );
  }
}

class IncomeExpense{
  double income;
  double expense;
  

  IncomeExpense({
    this.income,
    this.expense,
    
 });
  factory IncomeExpense.fromJson(Map<String, dynamic> parsedJson){
    return IncomeExpense(
      income: parsedJson['TotalIncome'],
      expense : parsedJson['TotalExpense'],
    );
  }
 }
