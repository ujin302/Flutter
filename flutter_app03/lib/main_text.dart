/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// extends: StatelessWidget 클라쓰 상속받겠다!
// StatelessWidget 클라쓰: 상태 연결 필요 X (갱신 X)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override 애너테이션: build()함수 재정의, 상속관계에서 부모 클래스의 멤버를 재정의
  @override
  // build(): 어떤 위젯을 만들 것인지 정의!
  Widget build(BuildContext context) {
    // MaterialApp(): 그림을 그리는데 필요한 도화지!!
    return MaterialApp(
      title: 'Text_Flutter Demo', // 앱 이름

        theme: ThemeData( // 앱의 테마 색상 지정
        primarySwatch: Colors.blue,
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),

      // home의 기본 구성으로 호출하지 않고 Text() 함수를 바로 대입하여 기본테마 적용
      // textAlign: TextAlign.center: 중앙 정렬
      // home: Text('Hellow\nFlutter', textAlign: TextAlign.center),

      // 화면 정중앙
      home: Container(
        // 배경색상 지정
        color: Colors.white,
          child: Center(
            // child: 자신 아래 어떤 위젯을 넣겠다
            child: Text(
              // 텍스트
              'Hellow\nFlutter',
              // 중앙 정렬
              textAlign: TextAlign.center,
              // 텍스트 색상, 크기
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          )
        // home: 애을 실행 할때 첫 화면!
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/