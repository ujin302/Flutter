import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondDetail();
}

class _SecondDetail extends State<SecondDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton( // ElevatedButton: 강조된 느낌의 버튼!
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/third');
            },
            child: Text('세 번째 페이지로 이동하기'),
          ),
        ),
      ),
    );
  }
}