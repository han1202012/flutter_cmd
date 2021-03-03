
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "第三方应用跳转",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("第三方应用跳转"),

          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Container(
          // 居中显示
          alignment: Alignment.center,

          // 垂直线性布局
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              // 打开浏览器按钮
              RaisedButton(
                // 匿名函数
                onPressed: () async {
                  const url = 'https://blog.csdn.net/shulianghan';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },

                // 按钮显示的组件
                child: Text("打开浏览器"),
              ),

              // 打开 Google 地图
              RaisedButton(
                // 匿名函数
                onPressed: () async {
                  // Android 谷歌地图的 scheme , 后面是北京市海淀区的经纬度
                  const url = 'geo:116.3,39.95';
                  if (await canLaunch(url)) {
                    // Android 手机, 打开 Google 地图
                    await launch(url);

                  } else { // 如果安卓手机打不开说明是苹果手机
                    const url_ios = 'http://maps.apple.com/?ll=116.3,39.95';
                    if (await canLaunch(url_ios)) {
                      await launch(url_ios);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                },

                // 按钮显示的组件
                child: Text("打开地图"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
