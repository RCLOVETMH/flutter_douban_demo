import 'package:doubanapp/models/home_model.dart';
import 'package:doubanapp/views/home/home.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {

  final MovieItem item;

  HomeDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页电影详情"),
        leading: RaisedButton(
          color: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Image.asset("assets/images/home/wish.png",),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          children: <Widget>[
            Image.network(item.imageURL,height: 200,)
          ],
        ),
      ),
    );
  }
}
