import 'package:flutter/material.dart';
import 'package:flutteranimatedchartsapp/categoryChart.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Charts extends StatefulWidget {
  Charts({Key key}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  var url = 'http://192.168.0.106:8081/tracker/register/monthlycategorysum?userId=41';
List customData;
  @override
  void initState() {
    super.initState();
    setState(() {
          customData=[];

    });
    getapidetails();
  }
  


  void getapidetails() async {
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    print('heyy');
    print(jsonResponse);
    setState(() {
          customData=jsonResponse;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HorizontalBarChart.withCustomData(customData),
            // child: Text("fgfg"),

    );
  }
}