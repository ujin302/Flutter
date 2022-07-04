/*// 비동기 1번
void main() {
  checkVersion();
  print('end procsee');
}

// 비동기 함수: Future 함수명() async

Future checkVersion() async{
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion(){
  return 13;
}*/

// 비동기 2번
// 비동기 main()
void main() async{
  // 비동기 함수가 데이터를 "성공적"으로 반환하면 then()함수를 이용해 처리
  // then(): 매개변수는 결과값을 인자로 가지는 함수, 에러 처리를 위한 함수이다!!
  await getName().then((value) => {
    print(value)
  });

  print('end procsee');
}

Future<String> getName() async{
  // await: 처리를 완료하고 결과를 반환할때 까지 코드 처리 멈춤.
  var Name = await lookupName();
  return Name;
}

String lookupName() {
  return "Android";
}

/*
// 다트, 쓰레드
void main() {
  printOne();
  printTwo();
  printThree();
}

void printOne(){
  print("One");
},

void printThree(){
  print("Three");
}

void printTwo() async{
  Future.delayed(Duration(seconds: 1),(){
    print("Future!");
  });
  print("Two");
}*/


/*
// json 데이터 디코딩(서버에서 json 데이터 받기)
import 'dart:convert';

void main(){
  // jsonString: json형태의 데이터 저장
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';  
  
  // jsonDecode(데이터): 이 함수에 데이터를 전달 한 후, 그 결과 저장
  // jsonDecode(데이터): 데이터를 dynamic 형식의 리스트로 변환해서 반환해준다!
  // 서버에서 json 데이터를 밷아서 사용 가능
  var scores = jsonDecode((jsonString));

  print(scores is List);

  var fScore = scores[0];
  // Map: 키와 값이 있는 형태 > key-value구조
  print(fScore is Map);
  print(fScore);
  print(fScore['score'] == 40);
}
*/

/*
// json 데이터 인코딩(서버에서 json 데이터 받기)
import 'dart:convert';
void main(){
  var score =
  [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(score);
  // " ": json데이터
  // ' ': 변수
  print(jsonText ==
      '[{"score":40},{"score":80},{"score":100,"overtime":true,"special_guest":null}]'
  );
  print(jsonText);
}
*/

/*
// 스트림 통신 1
import 'dart:async';
Future<int> sumStream(Stream<int> stream) async{
  var sum =0;
  await for(var value in stream){ // await: for문이 모두 수행될 때까지 기다린다! => 그래서 value에 stream값이 들어간다.
    print("sumStream: $value");
    sum +=value;
  }
  return sum;
}

// async*, yield: 비동기 함수
// async*명령어: yield를 이용해 지속석으로 데이터 전달, 데이터 반환 후에도 게속 함수 유지
Stream<int> countStream(int to) async*{
  for(int i=1; i<=to; i++){
    print("countStream: $i");
    yield i;
  }
}

main() async{
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);

  List<String> fruits = ['사과', '배', '포도', '귤', '딸기'];

  for (int i = 0; i<fruits.length; i++) {
    print('나는 ${fruits[i]}를 좋아해');
  }
}
*/

/*
// 스트림 통신 2
main() async{
  // Stream를 통해 데이터 사용시 데이터 사라짐
  var stream = Stream.fromIterable([1,2,3,4,5]);

  // Stream를 통해 데이터 사용 시, '한번'만 사용한다!
  // stream.first.then((value) => print('first: $value'));
  stream.last.then((value) => print('last: $value'));
  // stream.isEmpty.then((value) => print('isEmpty: $value'));
  // stream.length.then((value) => print('length: $value'));
}
*/

/*
// 구구단
void main(){
  for(int i=0; i<9; i++){
    for(int j=0; j<9; j++){
      int mul = (i+1)*(j+1);
      print("${i+1} * ${j+1} = $mul");
    }
    print("====================");
  }
}
*/


/*
// 자동차 클래스 구현
void main(){
 Car bmw = Car(320, 100000, 'BMW');
 Car benz = Car(250, 70000, 'BENZ');
 Car ford = Car(200, 80000, "FORD");

 bmw.saleCar();
 bmw.saleCar();
 bmw.saleCar();

 print(bmw.price);
}

// Car 클래스
class Car{
  int maxSpeed=0;
  // num 자료형: 정수 또는 실수
  num price=0;
  String name="";

  // Car 클래스의 생성자!
  Car(int maxSpeed, num price, String name){
    this.maxSpeed = maxSpeed;
    this.price = price;
    this.name = name;
  }
  // 함수 
  num saleCar(){
    price = price*0.9;
    return price;
  }
}
*/

/*
// 로또 번호 생성기
import 'dart:math'as math;
// as math: import 한 라이드러리를 변수명 math로 사용하겠다!
import 'dart:collection';
// HashSet를 사용하기 위해
// 중복을 허용하지 않는 리스트

void main(){
  var rand = math.Random();
  HashSet<int> lotteryNum = HashSet();
  while(lotteryNum.length < 6){
    lotteryNum.add(rand.nextInt(45)+1); // 0 출력 방지를 위한 +1
  }
  print(lotteryNum);
}
*/

