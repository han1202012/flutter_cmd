
import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "资源文件使用",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("资源文件使用"),

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
              Image(
                width: 200,
                height: 200,

                image: AssetImage("images/hunter.png"),
              )
            ],
          ),
        ),

      ),
    );
  }
}
