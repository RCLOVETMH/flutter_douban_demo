import 'package:doubanapp/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class NewsDetail extends StatelessWidget {

  final NewsModel news;

  NewsDetail(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.category),
      ),
      body: Container(
        child:WebviewScaffold(
          url: news.url,
        ),

      ),
    );
  }
}
