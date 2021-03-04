import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  /// 主题模式
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Theme 主题修改",

      theme: ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme 主题修改"),
        ),

        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  brightness = Brightness.light;
                });
              },
              child: Text("切换到日间主题"),
            ),

            RaisedButton(
              onPressed: (){
                setState(() {
                  brightness = Brightness.dark;
                });
              },
              child: Text("切换到夜间主题"),
            ),

          ],
        ),
      ),
    );
  }
}
