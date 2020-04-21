import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(String iconName,String title):
      super(
        icon:Image.asset("assets/images/tabbar/$iconName.png",width: 30,),
        activeIcon:Image.asset("assets/images/tabbar/${iconName}_active.png",width: 30,),
        title:Text(title,)
      );
}
/// 角标
/*
* Stack(
              children: <Widget>[
                Icon(Icons.home),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    color: Colors.red,
                    width: 15,
                    alignment: Alignment(0, 0),
                    child: Text("7",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
* */