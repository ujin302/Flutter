import 'package:flutter/cupertino.dart';
import '../animalItem.dart';
import '../cupertinoMain.dart';

class CupertinoFirstPage extends StatelessWidget {
  final List<Animal> animalList;

  const CupertinoFirstPage({Key? key, required this.animalList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 리스트'),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        animalList[index].imagePath!,
                        fit: BoxFit.contain,
                        width: 80,
                        height: 80,
                      ),
                      Text(animalList[index].animalName!) // ! == 널을 절대 안 가질 경우
                    ],
                  ),
                  Container(
                    height: 2,
                    color: CupertinoColors.black,
                  ),
                ],
              ),
            ),
            onTap: (){
              showCupertinoDialog(context: context, builder: (context){
                return CupertinoAlertDialog(
                  title: Text('이 동물 이름'),
                  content: Text(animalList[index].animalName!),
                  actions: [
                    CupertinoButton(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                );
              });
            },
          );
        },
        itemCount: animalList.length,
      ));
  }
}
