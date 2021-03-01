import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  /// 当前被选中的底部导航栏索引
  int _currentSelectedIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // 文本组件样式 , 可以设置给 Text 文本组件
    // 设置字体大小 20, 颜色红色
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.red);

    return MaterialApp(
      title: '布局组件示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // 顶部标题栏
        appBar: AppBar(title: Text('布局组件示例'),),

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

                    // 水平方向排列的线性布局
                    Row(
                      children: <Widget>[

                        // 原始图片, 用于对比
                        Image.network("https://img-blog.csdnimg.cn/20210301145757946.png",
                          width: 100,
                          height: 100,
                        ),

                        // 圆形裁剪组件 , 将 child 布局裁剪成圆形
                        ClipOval(
                          // 使用 SizedBox 组件约束布局大小
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            // 使用 SizedBox 约束该 Image 组件大小
                            child: Image.network("https://img-blog.csdnimg.cn/20210301145757946.png"),
                          ),
                        ),

                        Padding(
                          // 设置内边距 5
                          padding: EdgeInsets.all(15),

                          // 方形裁剪组件 , 将组件裁剪成方形
                          child: ClipRRect(
                            // 设置裁剪圆角, 四个角设置半径为 10 的圆角
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                            // 修改透明度组件 , 这里设置 50% 透明度
                            child: Opacity(
                                opacity: 0.5,
                                // 设置 100x100 大小的图片组件
                                child: Image.network("https://img-blog.csdnimg.cn/20210301145757946.png",
                                  width: 100,
                                  height: 100,
                                ),
                            ),
                          ),
                        ),

                      ],
                    ),

                    // 设置一个布局容器 , 用于封装 PageView 组件
                    Container(
                      // 设置高度
                      height: 200,
                      // 设置边距
                      margin: EdgeInsets.all(15),
                      // 设置装饰, 背景深橙色
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      // 设置子组件 PageView 的裁剪组件
                      child:
                      PhysicalModel(
                        color: Colors.transparent,

                        // 设置圆角半径 15
                        borderRadius: BorderRadius.circular(50),

                        // 设置裁剪行为 , 抗锯齿
                        clipBehavior: Clip.antiAlias,

                        // 设置 PageView 组件
                        child:
                        PageView(
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
                    ),
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    // 水平/垂直方向平铺组件
                    FractionallySizedBox(
                      // 设置宽度充满父容器
                      widthFactor: 1,

                      // 要设置的水平 / 垂直方向的平铺操作的组件
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text(
                          "高度自适应, 宽度充满父容器",
                          style: TextStyle(color: Colors.amberAccent),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // 帧布局
              Stack(
                children: <Widget>[
                  Image.network("https://img-blog.csdnimg.cn/20210301145757946.png",
                    width: 100,
                    height: 100,
                  ),

                  // 设置组件位置在 Stack 的相对位置
                  Positioned(
                    right: 0, // 距离右侧 0 距离
                    bottom: 0, // 距离底部 0 距离

                    // 设置约束的组件位置
                    child: Image.network("https://img-blog.csdnimg.cn/20210228180808133.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),

              // 可自动换行的水平线性布局
              Wrap(
                // 设置水平边距
                spacing: 40,

                // 设置垂直间距
                runSpacing: 10,

                children: <Widget>[
                  Chip(
                    // 设置主体标签文本
                    label: Text("宋江"),
                    // 设置左侧圆形头像
                    avatar: CircleAvatar(
                      // 设置背景颜色
                      backgroundColor: Colors.green.shade600,
                      child: Text("宋"),
                    ),
                  ),

                  Chip(
                    // 设置主体标签文本
                    label: Text("卢俊义"),
                    // 设置左侧圆形头像
                    avatar: CircleAvatar(
                      // 设置背景颜色
                      backgroundColor: Colors.green.shade600,
                      child: Text("卢"),
                    ),
                  ),


                  Chip(
                    // 设置主体标签文本
                    label: Text("吴用"),
                    // 设置左侧圆形头像
                    avatar: CircleAvatar(
                      // 设置背景颜色
                      backgroundColor: Colors.green.shade600,
                      child: Text("吴"),
                    ),
                  ),

                  Chip(
                    // 设置主体标签文本
                    label: Text("公孙胜"),
                    // 设置左侧圆形头像
                    avatar: CircleAvatar(
                      // 设置背景颜色
                      backgroundColor: Colors.green.shade600,
                      child: Text("公孙"),
                    ),
                  ),


                  Chip(
                    // 设置主体标签文本
                    label: Text("关胜"),
                    // 设置左侧圆形头像
                    avatar: CircleAvatar(
                      // 设置背景颜色
                      backgroundColor: Colors.green.shade600,
                      child: Text("关"),
                    ),
                  ),

                ],
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
