import 'package:flutter/material.dart';
import 'package:alog/alog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _printStr = "还未点打印按钮";
  var _modeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alog demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15,),
          buildTextContainer(),
          SizedBox(height: 30,),
          buildButton()
        ],
      ),
    );
  }

  Widget buildButton() {
    return RaisedButton(
      padding: EdgeInsets.all(8),
      child: Text("点我打印", style: TextStyle(fontSize: 15, color: Colors.white),),
      color: Colors.blue,
      onPressed: () {
        setState(() {
          // 打印，并显示结果
          _printStr = ALog("alog demo - $_modeIndex", mode: ALogMode.values[_modeIndex]);
          _modeIndex += 1;
          if (_modeIndex > 3) {
            _modeIndex = 0;
          }
        });
      },
    );
  }

  Widget buildTextContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(_printStr),
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xffd4d4d4)
      ),
    );
  }
}

