
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {

  /// 当前小球的 x 坐标
  double currentX = 0;
  /// 当前小球的 y 坐标
  double currentY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // 设置主题
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

      // 设置主体组件
      home: Scaffold(

        // 设置标题栏
        appBar: AppBar(
          title: Text("手势检测"),

          // 返回按钮设置
          leading: GestureDetector(
            // 点击事件回调函数
            onTap: (){
              // 退出当前界面
              Navigator.pop(context);
            },

            // 回退按钮图标
            child: Icon(Icons.arrow_back),
          ),
        ),

        // 水平/垂直方向平铺组件
        body: FractionallySizedBox(
          // 水平方向平铺
          widthFactor: 1,

          // 帧布局
          child: Stack(
            children: <Widget>[
              // 垂直方向线性布局
              Column(
                children: <Widget>[

                  // 手势检测组件
                  GestureDetector(
                    // 点击事件
                    onTap: (){
                      print("双击");
                    },

                    // 双击事件
                    onDoubleTap: (){
                      print("双击");
                    },

                    // 长按事件 , ()=>方法名(参数列表) 即可回调一个现有方法
                    onLongPress: () => _longPress(),

                    // 点击取消
                    onTapCancel: (){
                      print("点击取消");
                    },

                    // 点击按下
                    onTapDown: (e){
                      print("点击按下");
                    },

                    // 点击抬起
                    onTapUp: (e){
                      print("点击抬起");
                    },

                    // 手势检测的作用组件 , 监听该组件上的各种手势
                    child: Container(
                      // 子组件居中
                      alignment: Alignment.center,

                      // 内边距
                      padding: EdgeInsets.all(100),

                      // 背景装饰
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),

                      child: Text(
                        "手势检测",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.red,
                        ),
                      ),

                    ),
                  )
                ],
              ),

              // 小球
              Positioned(
                /// 当前位置
                left: currentX,
                top: currentY,

                /// 手势检测组件
                child: GestureDetector(

                  /// 移动操作
                  onPanUpdate: (e){
                    setState(() {
                      // e 中只能获取到 delta 值 , 需要逐步累加
                      currentX += e.delta.dx;
                      currentY += e.delta.dy;
                    });
                  },

                  // 黑色小球
                  child: Container(
                    width: 40,
                    height: 40,

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }

  /// 长按事件
  void _longPress(){
    print("长按");
  }
}
