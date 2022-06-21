import 'dart:convert';

import 'article_model.dart';

class NewsModel{
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  NewsModel({this.articles,this.totalResults,this.status});

  factory NewsModel.fromJson(Map<String,dynamic> json){
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List.from((json['articles']).map((e) => ArticleModel.fromJson(e))
    ));
  }
}