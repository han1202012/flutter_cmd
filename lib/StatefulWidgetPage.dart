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

        // 设置悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print("悬浮按钮点击");
          },
          child: Text("悬浮按钮组件"),
        ),

        // Container 容器使用
        body:
        _currentSelectedIndex == 0 ?

        // 刷新指示器组件
        RefreshIndicator(
          // 显示的内容
          child: ListView(
            children: <Widget>[
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
                    Text("主页面选项卡, 下拉刷新"),

                    // 图片组件 , 从网络中加载一张图片
                    Image.network(
                        // 图片地址
                      "https://img-blog.csdnimg.cn/20210228180808133.png",
                      // 图片宽度
                      width: 200,
                      // 图片高度
                      height: 200,
                    ),

                    // 输入框组件
                    TextField(
                      // 设置输入框样式
                      decoration: InputDecoration(
                        // 设置内容边距, 左右边距为 10, 上下边距为 0
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        // 设置的提示文案信息
                        hintText: "提示信息",
                        // 设置提示文案样式
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),

                    // 设置一个布局容器 , 用于封装 PageView 组件
                    Container(
                      // 设置高度
                      height: 200,
                      // 设置边距
                      margin: EdgeInsets.only(top: 10),
                      // 设置装饰, 背景深橙色
                      decoration: BoxDecoration(
                        color: Colors.deepOrange
                      ),
                      // 设置子组件 PageView
                      child: PageView(
                        // 设置 PageView 中封装的若干组件
                        children: <Widget>[
                          // 第一个页面组件
                          Container(
                            // 设置居中方式 , 居中显示
                            alignment:Alignment.center,
                            // 设置装饰器 , 绿色背景
                            decoration: BoxDecoration(color: Colors.green),
                            // 显示的主要文字
                            child: Text("页面 0", style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),

                          // 第二个页面组件
                          Container(
                            // 设置居中方式 , 居中显示
                            alignment:Alignment.center,
                            // 设置装饰器 , 绿色背景
                            decoration: BoxDecoration(color: Colors.red),
                            // 显示的主要文字
                            child: Text("页面 1", style: TextStyle(fontSize: 20, color: Colors.white),),
                          ),

                          // 第三个页面组件
                          Container(
                            // 设置居中方式 , 居中显示
                            alignment:Alignment.center,
                            // 设置装饰器 , 绿色背景
                            decoration: BoxDecoration(color: Colors.black),
                            // 显示的主要文字
                            child: Text("页面 2", style: TextStyle(fontSize: 20, color: Colors.yellow),),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

          // 刷新时回调的方法
          // 列表发生下拉操作时, 回调该方法
          // 该回调是 Future 类型的
          onRefresh: _refreshIndicatorOnRefresh,
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

  /// RefreshIndicator 发生下拉操作时, 回调该方法
  /// 该方啊是一个异步方法 , 在方法体前添加 async 关键字
  Future<Null> _refreshIndicatorOnRefresh() async{
    // 暂停 500 ms , 使用 await 关键字实现
    // 在这 500 ms 之间 , 列表处于刷新状态
    // 500 ms 之后 , 列表变为非刷新状态
    await Future.delayed(Duration(milliseconds: 500));
    return null;
  }

}
