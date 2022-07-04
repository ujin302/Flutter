import 'package:flutter/cupertino.dart';
import '../animalItem.dart';

class CupertinoSecondPage extends StatefulWidget {
  final List<Animal>? animallist;
  // key - value 형식의 생성자를 만드는 방법
  const CupertinoSecondPage({Key? key, required this.animallist}) : super(key: key);


  @override
  //  _CupertinoSecondPage()를 반환하는 createState() 함수 호출
  State<StatefulWidget> createState() {
    return _CupertinoSecondPage();
  }
}

class _CupertinoSecondPage extends State<CupertinoSecondPage> {
  TextEditingController? _textController; // 동물 이름
  int _kindChoice = 0; // 동물 종류
  bool _flyExist = false; // 날개 유무
  String? _imagePath; // 동물 이미지

  Map<int, Widget> segmentWidgets ={
    // SizedBox: 영역을 만들어 주는 위젯
    0: SizedBox(
      child: Text('양서류', textAlign: TextAlign.center),
      width: 80,
    ),
    1: SizedBox(
      child: Text('포유류', textAlign: TextAlign.center),
      width: 80,
    ),
    2: SizedBox(
      child: Text('파충류', textAlign: TextAlign.center),
      width: 80,
    ),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 텍스트 필드 사용을 위한 TextEditingController 선언, 입력한 값 저장할 변수 선언
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 추가'),
      ),
      // 텍스트 필드, 종류 선택, 날개 유무 확인 스위치, 동물 이미지 목록, 추가 버튼
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                // padding: 양 옆의 공간 주기
                padding: EdgeInsets.all(100),
                child: CupertinoTextField( // CupertinoTextField: ios 스타일 입력 창
                  controller: _textController, // _textController: 텍스트 입력 값
                  keyboardType: TextInputType.text,
                  placeholder: "동물 이름",
                  maxLines: 1, // maxLines: 최대로 입력할 수 있는 줄의 갯수
                ),
              ),
              CupertinoSegmentedControl(
                padding: EdgeInsets.only(bottom: 20, top: 0),
                groupValue: _kindChoice,
                children: segmentWidgets,
                // onValueChanged: 값이 바뀌었을 때 동작할 이벤트 정의
                onValueChanged: (int? value){
                  setState(() {
                    _kindChoice = value!;
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Text("날개가 존재합니까?"),
                  CupertinoSwitch(
                      value: _flyExist,
                      onChanged: (value) {
                        setState(() {
                          _flyExist = value;
                        });
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repo/images/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/pig.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/monkey.png';
                      },
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                  child: Text('동물 추가하기'),
                  onPressed: () {
                    widget.animallist?.add(Animal(
                        animalName: _textController?.value.text,
                        kind: getKind(_kindChoice),
                        imagePath: _imagePath,
                        flyExist: _flyExist));
                  })
            ],
          ),
        ),
      ),
    );
  }

  getKind(int radioValue){
    switch(radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "포유류";
      case 2:
        return "파충류";
    }
  }
}