import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget{
  @override
  _CupertinoPage createState() => _CupertinoPage();
}

class _CupertinoPage extends State<CupertinoPage> {
  double _value = 0.0;
  FixedExtentScrollController? firstCOntroller;

  void initState() {
    super.initState();
    firstCOntroller = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(child: Icon(Icons.arrow_back_ios), onPressed: () { },),
        middle: Text('Cupertino Style UI', style: TextStyle(color: Colors.blue),),
        trailing: CupertinoButton(child: Icon(Icons.exit_to_app), onPressed: () { },),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
                child: Text('Cupertino Button'),
                color: Colors.pink,
                onPressed: () {
                  showCupertinoModalPopup(context: context, builder: (context){
                    return CupertinoActionSheet( // 하단에 표시되는 알람창
                      title: Text('Action'),
                      message: Text('좋아하는 색'),
                      actions: [
                        CupertinoButton(child: Text('핑크'), onPressed: () { }),
                        CupertinoButton(child: Text('블랙'), onPressed: () { }),
                      ],
                      cancelButton: CupertinoButton(child: Text('취소'), onPressed: () {
                        Navigator.of(context).pop();
                      },),
                    );
                  });
                }
            ),
            RaisedButton(
                child: Text('Material Button'),
                color: Colors.teal,
                onPressed: () { }
            ),
/*            CupertinoActivityIndicator(
              radius: 20,
            ),*/
            CupertinoButton(
                child: Text('PICKER'),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          child: Column(
                            children: [
                              Expanded(child: CupertinoPicker(
                                itemExtent: 50,
                                backgroundColor: Colors.white70,
                                scrollController: firstCOntroller,
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    index = index;
                                  });
                                },
                                children: List<Widget>.generate(10, (index) {
                                  return Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          (index++).toString(),
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    );
                                },),
                              ),),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('취소')
                              ),
                            ],
                          ),
                        );
                      },
                  );
                }),
            Text(_value.toString()),
            CupertinoSlider(
              value: _value,
              onChanged: (index) {
                setState(() {
                  _value = index;
                });
              },
              max: 100,
              min: 0,
            ),
          ], mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}