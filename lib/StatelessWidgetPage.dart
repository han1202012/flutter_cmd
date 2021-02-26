import 'package:flutter/material.dart';

class StatelessWidgetPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 文本组件样式 , 可以设置给 Text 文本组件
    // 设置字体大小 20, 颜色红色
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.red);

    return MaterialApp(
      title: 'StatelessWidget 组件示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget 组件示例'),),

        // Container 容器使用
        body: Container(
          // 设置容器的装饰器 , BoxDecoration 是最常用的装饰器
          // 可以自行查看 BoxDecoration 中可以设置的属性
          decoration: BoxDecoration(color: Colors.grey),

          // 设置 child 子组件居中方式, 居中放置
          alignment: Alignment.center,

          // 子组件, 子组件设置为一个 Column 组件
          child: Column(
            // Column 子组件, 这里设置 Text 文本组件
            children: <Widget>[

              // Text 文本组件
              // textStyle 是之前创建的 TextStyle textStyle 对象
              Text('Container 中的 Text 文本组件示例', style: textStyle,),


              // Icon 图标组件
              Icon(Icons.map, size: 100, color: Colors.green,),

              // 关闭按钮
              CloseButton(),

              // 返回按钮
              BackButton(),

              // Chip 组件
              Chip(
                // Chip 组件的图标
                avatar: Icon(Icons.access_alarm, color: Colors.blue,),
                label: Text('闹钟', style: textStyle,),
              ),

              // Divider 分割线组件
              Divider(
                // 设置分割线容器高度
                height: 20,

                // 分割线左侧间距
                indent: 20,

                // 设置分割线颜色
                color: Colors.red,
              ),

              // Card 组件 : 可设置圆角 , 阴影 , 边框 等效果
              Card(
                // 设置卡片的背景颜色
                color: Colors.green,

                // 设置阴影
                elevation: 5,

                // 设置卡片的边距
                margin: EdgeInsets.all(10),

                // 设置子组件
                child: Container(
                  // 设置边距 10
                  padding: EdgeInsets.all(10),

                  // 设置卡片文字 , 设置卡片文字样式
                  child: Text("卡片文字", style: textStyle,),
                ),

              ),

              // AlertDialog 对话框 , 该弹窗有一个自动圆角和阴影
              AlertDialog(
                // 对话框标题
                title: Text("AlertDialog 对话框标题"),

                // 对话框内容
                content: Text("AlertDialog 对话框内容"),
              ),

            ],
          ),

        ),
      ),
    );
  }
}