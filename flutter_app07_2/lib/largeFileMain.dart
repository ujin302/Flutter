import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LargeFileMain();
}

class _LargeFileMain extends State<LargeFileMain> {
  TextEditingController? _editingController; // 입력 받은 url로 이미지 다운 받기
  bool downloading = false; // 파일 다운 로드 하였는지 확인 
  var progressString = ""; // 얼마나 다운 받았는지
  String file = ""; // 파일 경로

  @override
  void initState() {
    super.initState();
    _editingController = new TextEditingController(
      text: 'https://www.cheonyu.com/_DATA/product/56000/56081_1627351364.jpg'
    );
  }

  // 이미지 파일 다운로드 함수 
  Future<void> downloadFile() async{
    Dio dio = Dio(); // dio 선언 후, 내부 다렉토리 가져옴
    try{
      var dir = await getApplicationDocumentsDirectory();
      // getApplicationDocumentsDirectory() 함수: path_provider 페키지 제공하며, 플러터 앱의 내부 디렉토리 가져옴
      // 데이터를 통해 읽고 쓰는 어플리케이션 디렉터리 경로 반환
      await dio.download(_editingController!.value.text, '${dir.path}/myimage.jpg',
          // dio.download: url에 담긴 주소에서 파일 다운받음
          // 다운받은 파일은 내부 디렉토리 안에 'myimage.jpg'라는 이름으로 저장
          onReceiveProgress: (rec, total) {
            // onReceiveProgress(현재까지 다운받은 데이터, 파일의 전체 크기)함수: 다운받을 때마다 함수 실행하여 진행 상황 표시
            print('Rec: $rec, Total: $total');
            file = '${dir.path}/myimage.jpg';
            setState(() {
              downloading = true; // 다운받기 시작
              progressString = ((rec / total)*100).toStringAsFixed(0) + '%'; // 얼마나 다운 받았는지 계산
            });
          });
    } catch(e) { // e: 애러의 정보
      print(e);
    }
    setState(() {
      downloading = false; // 다운받기 끝
      progressString = 'Completed'; // 다운 받기 끝남을 알림
    });
    print('다운로드 완료');
  }

  // 화면을 그리는 함수
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          // controller 입력 받은 문자
          decoration: InputDecoration(hintText: 'url 입력'),
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
        ),
      ),
      body: Center(
        child: downloading // true일 때 실행
            ? Container(
          height: 120.0,
          width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 20.0,),
                    Text(
                      'Downloading File: $progressString',
                      style: TextStyle(color: Colors.white,),
                    )
                  ],
                ),
              ),
            )
        // downloading == false 일때의 위젯
        // FutureBuilder위젯을 이용해 이미지 내려받기 화면 그림
        // => 데이터가 없지만 앞으로 데이터를 받아 처리 후 만들겠다!
            : FutureBuilder(
              builder: (context, snapshot) { // snapshot: FutureBuilder.future에서 받아온 데이터를 저장한 dynamic 형태의 변수
                switch (snapshot.connectionState) { // connectionState == done 이면 snapshot.data값 반환
                  case ConnectionState.none: // FutureBuilder.future == null
                    print('none');
                    return Text('데이터 없음');
                  case ConnectionState.waiting: // 연결되기 전(FutureBuilder.future에서 데이터를 반환받지 않았을 때)
                      print('waiting');
                      return CircularProgressIndicator();
                      // CircularProgressIndicator(): 원 그리는 함수
                  case ConnectionState.active: // 하나 이상의 데이터 반환
                      print('active');
                      return CircularProgressIndicator();
                  case ConnectionState.done: // 모든 데이터를 받아서 연결이 끝날 때
                      print('done');
                      if(snapshot.hasData) {
                        return snapshot.data as Widget;
                        // snapshot: 받아온 데이터를 저장한 dynamic 혀애의 변수
                      }
                }
                print('end process');
                return Text('데이터 없음');
              },
              future: downloadWidget(file),
            )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  // 이미지 파일이 있는지 확인
  // 있으면 화면에 보여주는 위젯 반환
  // 없으면 No Date 텍스트 출력 
  // 이미지 파일 유무에 따라 화면을 그릴 환경 설정하는 함수
  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    new FileImage(file).evict();
    // evict() 함수: 캐시(데이터를 빠르게 처리하기 위해 임시로 저장하는 메모리) 초기화
    // 만약 캐시에 같은 이름의 이미지가 있으면 이미지 변경하지 않고 해당 이미지 사용
    // 하지만, evict() 함수를 호출하여 캐시를 비우면 같은 이름이어도 이미지 갱신!
    if(exist) {
      return Center(
        child: Column(
          children: <Widget>[Image.file(File(filePath))],
        ),
      );
    }else{
      return Text("No Data");
    }
  }
}