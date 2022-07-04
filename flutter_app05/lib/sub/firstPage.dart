import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  @override
  // BuildContext: 위젯의 정보를 가지고 있음.
  // build: Widget의 메소드
  // BuildContext: 위젯 트리상에서 현재 위젯의 위치 정보
  Widget build(BuildContext conT) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),
        ),
      ),
    );
  }
}
