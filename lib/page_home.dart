import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var resultStr = 'Unknown';

  _getResult() async {
    var url = 'https://api.github.com/';
    Dio _dio = Dio();
    String result;
    try {
      var response = await _dio.get(url);
      if(response.statusCode==HttpStatus.ok) {
      result = response.data['current_user_url'];

      } else{
        result='Error';
      }
    } catch (e) {
      result = e.toString();
    }
    if (!mounted) return;
    setState(() {
      resultStr = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = SizedBox(
      height: 10,
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          children: [
            Text('请求结果为:'),
            spacer,
            Text('$resultStr'),
            RaisedButton(
              onPressed: _getResult,
              child: Text('请求'),
            )
          ],
        ),
      ),
    );
  }
}
