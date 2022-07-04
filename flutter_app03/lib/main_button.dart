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
  String test = 'hellow';
  Color _color = Colors.blue;

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
            child: ElevatedButton( // ElevatedButton: 버튼 강조하고 싶을 때
                child: Text('$test'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_color),
                ),
                onPressed: () {
                  if(test == 'hellow' || _color == Colors.blue){
                    setState(() {
                      test = 'flutter';
                      _color = Colors.amber;
                    });
                  }else{
                    setState(() {
                      test = 'hellow';
                      _color = Colors.blue;
                    });
                  }
                })),
      ),
    );
  }
}
*/
