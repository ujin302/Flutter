import 'package:flutter/material.dart';

class ThirdDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThirdDetail();
}

class _ThirdDetail extends State<ThirdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton( // ElevatedButton: 강조된 느낌의 버튼!
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('첫 번째 페이지로 돌아가기'),
          ),
        ),
      ),
    );
  }
}