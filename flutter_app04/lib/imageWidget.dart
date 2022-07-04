import 'package:flutter/material.dart';
// import 'package:flutter_app04/imageWidget.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Image Widget'),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // fit: BoxFit.fill -> 200*100 크기로 보인다!
            children: <Widget>[
              Image.asset('image/flutter.png', width: 200, height: 100, fit: BoxFit.fill),
              Text('Hellow Flutter',
                style: TextStyle(fontFamily: 'Pacifico',
                fontSize: 30, color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}