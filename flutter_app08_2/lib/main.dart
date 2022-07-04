import 'package:flutter/material.dart';
import 'package:flutter_app08_2/subDetail.dart';
import 'secondDetail.dart';
import 'thirdDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp: 페이지를 담는 그릇 ㄴ
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // 처음 애을 시작했을 때 보여 줄 경로 지정
      // '/': 앱을 실행하면 첫 번째 페이지 보여줌!
      routes: {
        '/': (context) => SubDetail(),
        '/second': (context) => SecondDetail(),
        '/third': (context) => ThirdDetail(),
      },
    );
  }
}
