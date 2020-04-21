import 'package:doubanapp/const_config/const_config.dart';
import 'package:doubanapp/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {

  final NewsModel news;
  NewsListItem(this.news);

  final double imageW = (RCWIDTH-40)/3.floor();
  final double imageH = 100;



  @override
  Widget build(BuildContext context) {

    List <String>pics = [news.thumbnail_pic_s];
    if(news.thumbnail_pic_s02 != null){
      pics.add(news.thumbnail_pic_s02);
    }
    if(news.thumbnail_pic_s03 != null){
      pics.add(news.thumbnail_pic_s03);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 10,color: Color(0xffe8e8e8)),
        ),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            news.title,
            style: TextStyle(fontSize: 16,color: Colors.black87),
            maxLines: 2,
            overflow: TextOverflow.ellipsis
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:List.generate(pics.length, (int index){
              return Image.network(pics[index],width: imageW,height: imageH,);
            })
          ),
          SizedBox(height: 5,),
          Text(
            "${news.author_name}  ${news.date}",
            style: TextStyle(fontSize: 14,color: Colors.black38)
          )
        ],
      ),
    );
  }
}
