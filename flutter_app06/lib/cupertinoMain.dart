import 'package:flutter/cupertino.dart';

import 'sub/CupertinoSecondPage.dart';
import 'sub/CupertinoFirstPage.dart';
import 'animalItem.dart';

class CupertinoMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Animal> animalList = List.empty(growable: true);
  @override
  void initState() {
    super.initState(); // 초기화
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);

    animalList.add(Animal(animalName: "벌", kind: "곤충",
        imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName: "고양이", kind: "포유류",
        imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: "젖소", kind: "포유류",
        imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: "강아지", kind: "포유류",
        imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류",
        imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "영장류",
        imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류",
        imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류",
        imagePath: "repo/images/wolf.png"));
  }

  @override
  Widget build(BuildContext context){
    // ios 스타일 CupertinoApp 반환
    // App은 가장 큰 부분, scaffold는 페이지 구성(골격)
    return CupertinoApp(
      home: CupertinoTabScaffold(tabBar: tabBar!, tabBuilder: (context, value) {
        if(value == 0) { // value 0 or 1 반환
          return CupertinoFirstPage(animalList: animalList);
        } else{
          return CupertinoSecondPage(animallist: animalList);
        }
      }),
    );
  }
}