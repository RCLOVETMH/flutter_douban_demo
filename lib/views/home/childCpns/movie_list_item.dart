import 'package:doubanapp/components/dashed_line.dart';
import 'package:doubanapp/components/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:doubanapp/models/home_model.dart';

class MovieListItem extends StatelessWidget {
  final MovieItem item;
  MovieListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 10,color: Color(0xffe8e8e8))
        ),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RankWidget(),
          SizedBox(height: 10,),
          MovieContentWidget(),
          SizedBox(height: 10,),
          OriginWidget(),
        ],
      ),
    );
  }

  // 1、获取排名显示widget
  Widget RankWidget(){
    return Container(
      //padding: EdgeInsets.fromLTRB(9, 5, 9, 5),
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 9),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 208, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(
        "No.${item.rank}",
        style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),
      )
    );
  }

  // 2、获取电影信息内容
  Widget MovieContentWidget(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MovieImage(),
        MovieDetailWidget(),
        DashedLineWidget(),
        WishPlayWidget()
      ],
    );
  }

  // 2.1、显示电影的图片
  Widget MovieImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(item.imageURL,height: 150,),
    );
  }

  // 2.2、具体的描述
  Widget MovieDetailWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieNameWidget(),
            RatingWidget(),
            IntroduceWidget(),
          ],
        ),
      ),
    );
  }

  // 2.2.1 获取电影名称的展示
  Widget MovieNameWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline,color: Colors.red,size: 24),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: "      " + item.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ) ),
            TextSpan(text: " (${item.playDate})",style: TextStyle(fontSize: 18,color: Colors.black54))
          ]
        )
        )

      ],
    );
  }

  // 2.2.2 获取电影星星评分
  Widget RatingWidget() {
    return StarRating(
      rating: item.rating
    );
  }
  //2.2.3、获取电影的简介
  Widget IntroduceWidget(){
    final genresString = item.genres.join(" ");
    final director = item.director.name;
    final actorString = item.casts.join(" ");
    return Text(
      "$genresString / $director /$actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 15),
    );
  }

  // 2.3、分割线
  Widget DashedLineWidget() {
    return Container(
      width: 1,
      height: 90,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 4,
        count: 10,
        color: Color.fromARGB(255, 235, 170, 60),
      ),
    );
  }
  // 2.4、想看
  Widget WishPlayWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/home/wish.png",width: 30,),
          SizedBox(height: 5),
          Text("想看",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 235, 170, 60)))
        ],
      ),
    );
  }

  // 3、原始电影的别名
  Widget OriginWidget(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xfff2f2f2)
      ),
      child: Text(
        item.originalTitle,
        style: TextStyle(fontSize: 16,color: Colors.black54),
      ),
    );
  }

}
