import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpApp createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  List? data;
  TextEditingController? _editingController;
  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
    _editingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어 입력'),
        ),
      ),
      body: Container(
        child: Center(
          child: data!.length == 0
          ? Text(
            "데이터 없음",
            style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          )
              :ListView.builder(
                itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(data![index]['title'].toString()),
                        Text(data![index]['authors'].toString()),
                        Text(data![index]['sale_price'].toString()),
                        Text(data![index]['status'].toString()),
                        Image.network(
                          data![index]['thumbnail'],
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                );
          },
          itemCount: data!.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 사용자가 버튼을 누르면 http.get을 통해 url에 입력한 주소에 데이터 전송
        // 해당 주소가 응답함 가져온 데이터를 result에 넣고 본문을 텍스트 위젯에 출력
        onPressed: () async {
          getJSONData();
        },
        child: Icon(Icons.file_download), // 파일 내려받는 아이콘
      ),
    );
  }

  Future<String> getJSONData() async{
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    // 서버가 데이터 넘겨줄 때까지 대기
    var response = await http.get(Uri.parse(url), // get방식으로 url 접속
        headers: {"Authorization": "KakaoAK {d87ed966858cefb8b35f43dfc47648f2}"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List<dynamic> result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
//    return "response.body";
  }
}
