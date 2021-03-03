import 'package:flutter/material.dart';
import 'package:flutter_cmd/GesturePage.dart';
import 'package:flutter_cmd/ResourcePage.dart';
import 'package:flutter_cmd/StatelessWidgetPage.dart';
import 'LayoutPage.dart';
import 'StatefulWidgetPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 设置标题
      title: 'Flutter Demo',

      // 设置主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // 设置界面主组件
      home: Scaffold(
        // 设置标题栏
        appBar: AppBar(
          title: Text("路由与导航"),
        ),

        // 设置界面主体组件
        body: RouteNavigator(),
      ),

      // 配置路由
      routes: <String, WidgetBuilder>{
        "StatelessWidgetPage" : (BuildContext context) => StatelessWidgetPage(),
        "StatefulWidgetPage" : (BuildContext context) => StatefulWidgetPage(),
        "LayoutPage" : (BuildContext context) => LayoutPage()
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "LayoutPage");
            },
            child: Text("通过路由名跳转到页面1"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "StatefulWidgetPage");
            },
            child: Text("通过路由名跳转到页面2"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, "StatelessWidgetPage");
            },
            child: Text("通过路由名跳转到页面3"),
          ),


          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPage()));
            },
            child: Text("通过导航跳转到页面1"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatefulWidgetPage()));
            },
            child: Text("通过导航跳转到页面2"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatelessWidgetPage()));
            },
            child: Text("通过导航跳转到页面3"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GesturePage()));
            },
            child: Text("手势检测界面"),
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResourcePage()));
            },
            child: Text("资源使用界面"),
          ),

        ],
      ),
    );
  }
}
