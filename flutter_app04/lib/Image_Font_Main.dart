/*
import 'package:flutter/material.dart';
import 'imageWidget.dart';

void main() {
  runApp(MyApp());
  print('04');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      title: 'Material Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MaterialFlutterApp(),
      home: ImageWidgetApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // _변수명, _함수명 : 외부로 노출하고 싶지 않다
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp> {
  @override
  // build: 앱 화면에 찍어내는 함수
  Widget build(BuildContext context){
    // Scaffold: Material 디자인 레이아웃으로 설계하기 위해 돕는 역할
    return Scaffold(
      // 앱 화면 위에 있는 글씨
      appBar: AppBar(title: Text('Material Design App'),),
      // 버튼!
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () {

        },),
      body: Container(
        // 가운데 정렬(가로)
        child: Center(
          // 자식 한개
          child: Column(
            // 자식 여러개
            // Icons.android: 안드로이드 대표 이미지
            children: <Widget>[Icon(Icons.android), Text('android')],
            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬(세로)
          ),
        ),
      ),
    );
  }
}*/
