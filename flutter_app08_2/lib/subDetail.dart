import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubDetail();
}

class _SubDetail extends State<SubDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton( // ElevatedButton: 강조된 느낌의 버튼!
            onPressed: () {
              Navigator.of(context).pushNamed('/second');
              // Navigator.of(context).pushReplacementNamed('/second');
              // pushReplacementNamed: 스택에 있는 메모리 자료 교체!
            },
            child: Text('두 번째 페이지로 이동하기'),
          ),
        ),
      ),
    );
  }
}