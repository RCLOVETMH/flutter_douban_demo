import 'package:doubanapp/components/tabbar_item.dart';
import 'package:doubanapp/const_config/const_config.dart';
import 'package:doubanapp/views/group/gorup.dart';
import 'package:doubanapp/views/home/home.dart';
import 'package:doubanapp/views/mall/mall.dart';
import 'package:doubanapp/views/profile/profile.dart';
import 'package:doubanapp/views/subject/subject.dart';
import 'package:flutter/material.dart';

void main (List<String> agrs) => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "我是豆瓣",
      home: MyStackPageWidget(),
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}

class MyStackPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyStatePageWidgetState();
  }
}

class MyStatePageWidgetState extends State<MyStackPageWidget>{
  int  _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    RCWIDTH = size.width;
    RCHEIGHT = size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
       // selectedItemColor: Colors.red,
       // unselectedItemColor: Colors.greenAccent,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          TabBarItem("home", "首页"),
          TabBarItem("subject", "书影音"),
          TabBarItem("group", "小组"),
          TabBarItem("mall", "市集"),
          TabBarItem("profile", "我的"),
        ],
        onTap: (int value){
          setState(() {
            _currentIndex = value;
          });
        }, 
      ),
      body:IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile()
        ],
      ),
    );
  }
}


