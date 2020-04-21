import 'package:doubanapp/const_config/const_config.dart';
import 'package:doubanapp/models/news_model.dart';
import 'package:doubanapp/network/http_request.dart';
import 'package:doubanapp/views/subject/NewsDetail.dart';
import 'package:doubanapp/views/subject/childCpns/news_list_item.dart';
import 'package:flutter/material.dart';

double WIDTH = 0;
double HEIGHT = 0;


class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    WIDTH = size.width;
    HEIGHT = size.height;

    return Scaffold(
      appBar: AppBar(title: Text("书影音"),),
      body: SubjectBody()
    );
  }
}

class SubjectBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SubjectBody> {
  List<NewsModel> newsList = [];
  @override
  void initState() {
    super.initState();

    HttpRequest.request("https://v.juhe.cn/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58")
    .then((res){
      final jsosMap = res.data;
      final data_ = jsosMap["result"]["data"];
      List<NewsModel> newsList = [];
      for(var sub in data_){
        NewsModel news = NewsModel.fromMap(sub);
        newsList.add(news);
      }
      setState(() {
        this.newsList = newsList;
      });
     }).catchError((err){
      print(err);
    });
  }

  final ImageW = (RCWIDTH - 40) / 3 .floor();
  double ImageH = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe8e8e8),
      child: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            child: NewsListItem(newsList[index]),
            onTap: (){
              NewsClick(index);
            },
          );
        },
      ),
    );
  }

  void NewsClick(int index){
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return NewsDetail(newsList[index]);
      }
    ));
  }
}
