
import 'dart:convert';

class NewsModel {
  String uniquekey;
  String title;
  String date;
  String category;
  String author_name;
  String url;
  String thumbnail_pic_s;
  String thumbnail_pic_s02;
  String thumbnail_pic_s03;
  List thumbnailPics = [];

  NewsModel.fromMap(Map<String,dynamic> json){
    this.uniquekey = json["uniquekey"];
    this.title = json["title"];
    this.date = json["date"];
    this.category = json["category"];
    this.author_name = json["author_name"];
    this.url = json["url"];
    this.thumbnail_pic_s = json["thumbnail_pic_s"];
    this.thumbnail_pic_s02 = json["thumbnail_pic_s02"];
    this.thumbnail_pic_s03 = json["thumbnail_pic_s03"];
  }



  List get getThumbnailPics{

    print("111111111111");

    thumbnailPics.add(this.thumbnail_pic_s);
    if(this.thumbnail_pic_s02 != null){
      thumbnailPics.add(this.thumbnail_pic_s02);
    }
    if(this.thumbnail_pic_s03 != null){
    thumbnailPics.add(this.thumbnail_pic_s03);
    }

    print(thumbnail_pic_s);

    return thumbnailPics;
  }

}