import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  @override
  _StatefulWidgetPageState createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {

  /// 当前被选中的底部导航栏索引
  int _currentSelectedIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 文本组件样式 , 可以设置给 Text 文本组件
    // 设置字体大小 20, 颜色红色
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.red);

    return MaterialApp(
      title: 'StatefulWidgetPage 组件示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // 顶部标题栏
        appBar: AppBar(title: Text('StatefulWidgetPage 组件示例'),),

        // 底部导航栏 BottomNavigationBar 设置
        // items 可以设置多个 BottomNavigationBarItem
        bottomNavigationBar: BottomNavigationBar(

          // 设置当前选中的底部导航索引
          currentIndex: _currentSelectedIndex,

          // 设置点击底部导航栏的回调事件 , index 参数是点击的索引值
          onTap: (index){
            // 回调 StatefulWidget 组件的 setState 设置状态的方法 , 修改当前选中索引
            // 之后 BottomNavigationBar 组件会自动更新当前选中的选项卡
            setState(() {
              // 改变 int _currentSelectedIndex 变量的状态
              _currentSelectedIndex = index;
            });
          },

          // 条目
          items: [

          // 设置底部导航栏条目, 每个条目可以设置一个图标
          BottomNavigationBarItem(
            // 默认状态下的图标
            icon: Icon(Icons.home, color: Colors.grey,),

            // 激活状态下的图标
            activeIcon: Icon(Icons.home, color: Colors.red,),

            // 设置标题
            title: Text("主页")
          ),

          // 设置底部导航栏条目, 每个条目可以设置一个图标
          BottomNavigationBarItem(
            // 默认状态下的图标
            icon: Icon(Icons.settings, color: Colors.grey,),

            // 激活状态下的图标
            activeIcon: Icon(Icons.settings, color: Colors.red,),

              // 设置标题
              title: Text("设置")
          )

        ],),

        // Container 容器使用
        body:
        _currentSelectedIndex == 0 ?

        Container( // 对应底部导航栏主界面选项卡
          // 设置容器的装饰器 , BoxDecoration 是最常用的装饰器
          // 可以自行查看 BoxDecoration 中可以设置的属性
          decoration: BoxDecoration(color: Colors.white),

          // 设置 child 子组件居中方式, 居中放置
          alignment: Alignment.center,

          // 子组件, 子组件设置为一个 Column 组件
          child: Column(
            // Column 子组件, 这里设置 Text 文本组件
            children: <Widget>[
              Text("主页面选项卡")


            ],
          ),

        )
        :
        Container( // 对应底部导航栏设置选项卡
          // 设置容器的装饰器 , BoxDecoration 是最常用的装饰器
          // 可以自行查看 BoxDecoration 中可以设置的属性
          decoration: BoxDecoration(color: Colors.white),

          // 设置 child 子组件居中方式, 居中放置
          alignment: Alignment.center,

          // 子组件, 子组件设置为一个 Column 组件
          child: Column(
            // Column 子组件, 这里设置 Text 文本组件
            children: <Widget>[
              Text("设置页面选项卡")


            ],
          ),

        ) , // 该设置与 _currentSelectedIndex == 0? 相对应, ?: 三目运算符
      ),
    );
  }
}
