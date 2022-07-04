import 'package:flutter/material.dart';
import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal> list;
  FirstApp({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context, position){ // position: 리스트에서 아이템의 위치
            return GestureDetector( //  사용자의 동작 감지하는 위젯
              // 위젯을 이용하여 데이터 표시
              child: Card( // 카드형태 모양을 제공하는 위젯
                  child: Row( // 가로
                    children: <Widget>[
                      Image.asset(
                        // 변수명! : 이 변수는 null값이 아니야! 라고 확신하는 변수
                        list[position].imagePath!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].animalName!)
                    ],
                  ),
                ),
              onTap: () {
                  // dialog라는 이름을 가진 알림창 생성
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 동물은 ${list[position].kind}입니다.',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  );
                  // 알림창 띄우기 
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => dialog
                  );
              },
            );
          },
          // 아이템 갯수만큼만 스크롤 가능
          itemCount: list.length
          ),
        ),
      ),
    );
  }
}