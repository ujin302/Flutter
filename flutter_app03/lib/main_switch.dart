/*


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

// StatefulWidget 클라스: 혼자서 화면 출력 못함. State 클라스 필요!
class _MyApp extends State<MyApp> {
  var switChValue = false;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Switch Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Switch(
              value: switChValue,
              onChanged: (value) {
                setState(() { // 데이터 바뀌었다는 것을 앱에 알려 화면 갱신
                  print('1: $value');
                  switChValue = value;
                });
              }),
        ),
      ),
    );
  }
}
*/
