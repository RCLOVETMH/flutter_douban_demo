import 'package:dio/dio.dart';
import 'package:doubanapp/models/home_model.dart';
import 'package:doubanapp/network/http_config.dart';
import 'package:doubanapp/network/http_request.dart';
import 'package:doubanapp/views/home/HomeDetail.dart';
import 'package:doubanapp/views/home/childCpns/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    Future<String> loadString = DefaultAssetBundle.of(context).loadString("assets/json/movie.json").then((value){
      final jsonMap = json.decode(value);
      final subjects = jsonMap["subjects"];
      List<MovieItem> movies = [];
      for(var sub in subjects){
        MovieItem item = MovieItem.fromMap(sub);
        movies.add(item);
      }
      setState(() {
        this.movies = movies;
      });
    }).catchError((err){
      print("本地json读取失败");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xffe8e8e8),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              child: MovieListItem(movies[index]),
              onTap: (){
                itemClick(index);
              },
            );
            //return MovieListItem(movies[index]);
          }
        ),
      ),
    );
  }

  void itemClick(index){
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetail()));
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return HomeDetail(movies[index]);
      }
    ));
  }
}
