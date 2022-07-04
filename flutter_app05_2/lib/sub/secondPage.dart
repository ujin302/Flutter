import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondApp();
  //  _SecondApp()를 반환하는 createState() 함수 호출
  List<Animal>? list;

  SecondApp({Key? key, @required this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  // final: 값 변경 X, 런타임에서 결정되는 것 값 설정 가능 O
  // 값이 객체인 겨우, 안의 요소 변경 가능
  // 클래스의 인스턴스 할당 가능
  int _radioValue = 0;
  bool? flyExit = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 왼쪽 정렬
            children: <Widget>[ // []안에 위젯 담기
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLength: 100,
              ),
              Row(
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
                  Text("양서류"),
                  Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
                  Text("파충류"),
                  Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
                  Text("포유류"),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround
                // 첫번째, 미자막 앞뒤에 여유 공간 == 중간 child 공간/2
              ),
              Row(
                children: <Widget>[
                  Text("날 수 있나요?"),
                  Checkbox(value: flyExit, onChanged: (bool? check) {
                    setState(() {
                      flyExit = check;
                    });
                  })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal, // 수평으로 스크롤
                  children: <Widget>[
                      GestureDetector(
                        child: Image.asset("repo/images/cow.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/cow.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/pig.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/pig.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/bee.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/bee.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/cat.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/cat.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/dog.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/dog.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/fox.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/dog.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset("repo/images/monkey.png", width: 80),
                        onTap: () {
                          _imagePath = "repo/images/dog.png";
                        },
                      ),
                  ],
                ),
              ),
              ElevatedButton( // 동물 목록에 추가하기
                  child: Text('동물 추가하기'),
                  onPressed: () {
                    var animal = Animal(
                        animalName: nameController.value.text,
                        kind: getkind(_radioValue),
                        imagePath: _imagePath,
                        flyExist: flyExit);
                    AlertDialog dialog = AlertDialog(
                      title: Text('동물 추가'),
                      content: Text(
                        '이 동물은 ${animal.animalName}입니다. '
                        '또 동물의 종류는 ${animal.kind}입니다. \n이 동물을 추가하시겠습니까?',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              widget.list?.add(animal);
                              Navigator.of(context).pop();
                        },
                        child: Text('예')
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                        child: Text('아니요'),
                        ),
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _radioChange(int? value) { // value: 버튼이 눌렸을 때 라디오 버튼의 인덱스 값
    setState(() {
      _radioValue = value!;
    });
  }

  getkind(int? radioValue){
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return "포유류";
    }
  }
}