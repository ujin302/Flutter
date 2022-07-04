import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    //  home: FirstPage(),
      initialRoute: '/',
      routes: {'/': (context) => FirstPage(),
      '/second': (context) => SecondPage()},
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page Main'),
      ),
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
          Navigator.of(context).pushNamed('/second');
          // pushNamed: 페이지 이동 시에 'routes'에 선언한 경로 이용!
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


// 스택 메모리에 페이지가 쌓이는 구조!
// 돌아가기 버튼: 아이폰, 안드로이드 모두 돌아가기 기능 제공
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // 현재 페이지 종료 -> 스택 메모리서 두번째 화면 사라짐
            },
            child: Text('돌아가기'),
          )
        ),
      ),
    );
  }
}
