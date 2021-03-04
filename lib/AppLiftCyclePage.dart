
import 'package:flutter/material.dart';

class AppLifeCyclePage extends StatefulWidget {
  @override
  _AppLifeCyclePageState createState() => _AppLifeCyclePageState();
}

class _AppLifeCyclePageState extends State<AppLifeCyclePage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    /// 如果想要监听应用生命周期 , 要先绑定观察者 ,
    /// 绑定完成后 , 如果应用生命周期发生了变化 ,
    /// 就会回调 didChangeAppLifecycleState 方法 ;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 标题
        title: Text("应用生命周期"),

        // 返回按钮
        leading: BackButton(),
      ),

      body: Container(
        // 居中设置
        alignment: Alignment.center,

        child: Text("应用生命周期"),
      ),
    );
  }

  /// 移出组件中注册的观察者
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  /// 当应用生命周期发生变化时 , 会回调该方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print("当前的应用生命周期状态 : ${state}");

    if(state == AppLifecycleState.paused){
      print("应用进入后台 paused");

    }else if(state == AppLifecycleState.resumed){
      print("应用进入前台 resumed");

    }else if(state == AppLifecycleState.inactive){
      // 应用进入非活动状态 , 如来了个电话 , 电话应用进入前台
      // 本应用进入该状态
      print("应用进入非活动状态 inactive");

    }else if(state == AppLifecycleState.detached){
      // 应用程序仍然在 Flutter 引擎上运行 , 但是与宿主 View 组件分离
      print("应用进入 detached 状态 detached");

    }
  }
}
