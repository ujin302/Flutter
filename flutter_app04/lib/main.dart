import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  print('04');
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget{
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonList = ['더하기', '뺴기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  // 자료형?: 변수 초기화 시키고 싶지 않을 경우 사용! null 가능
  String? _buttonText;

  @override
  void initState() {
    super.initState();
    for(var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText =_dropDownMenuItems[0].value;
  }
  // 숫자 두개 입력
  String sum ='';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              // 결과 값 출력
              Padding(
                padding: EdgeInsets.all(15), // EdgeInsets.add: 사방으로 모든 공간에 여백 생김!
                // 결과 값 출력
                child: Text(
                  '결과: $sum',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // 값1 입력
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20), // EdgeInsets.only: 상하좌우 원하는 공가넹 여백 넣기!
                // 숫자 입력창
                child: TextField(keyboardType: TextInputType.number, controller: value1),
              ),
              // 값 2 입력
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20), // EdgeInsets.only: 상하좌우 원하는 공가넹 여백 넣기!
                child: TextField(keyboardType: TextInputType.number, controller: value2),
              ),
              // 연산 버튼
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add),
                        Text('$_buttonText')
                      ],
                    ),

                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                    onPressed:() {
                      setState(() {
                        var valueInt1 = int.parse(value1.value.text);
                        var valueInt2 = int.parse(value2.value.text);
                        var result;
                        if(_buttonText == '더하기') {
                          result = valueInt1 + valueInt2;
                        } else if(_buttonText == '나누기'){
                          result = valueInt1 / valueInt2;
                        } else if(_buttonText == '뺴기'){
                          result = valueInt1 - valueInt2;
                        } else if(_buttonText == '곱하기'){
                          result = valueInt1 * valueInt2;
                        }
                        sum = '$result';
                      });
                    }
                ),
              ),
              // 아이템 선택
              Padding(
                padding: EdgeInsets.all(15),
                // 펼침 버튼(onChanged: 아이템 목록이 바뀔때 처리)
                //  onChanged: (String? value) => value: 리스트 값 중에서 사용자가 선택한 값 받아옴!
                child: DropdownButton(items: _dropDownMenuItems, onChanged: (String? value) {
                  setState(() {
                    _buttonText = value;
                  });
                }, value: _buttonText,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

