import 'dart:convert';

import 'package:clean_architecture_with_getx/data/model/source_model.dart';
import 'package:clean_architecture_with_getx/domain/entities/article.dart';

class ArticleModel extends Article {
  final int? id;
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel(
      {this.id,
        this.publishedAt,
      this.author,
      this.content,
      this.title,
      this.urlToImage,
      this.url,
      this.description,
      this.source})
      : super(
          id:id,
          source: source,
          title: title,
          publishedAt: publishedAt,
          content: content,
          author: author,
          description: description,
          urlToImage: urlToImage,
          url: url,
        );

  factory ArticleModel.fromJson(Map<String,dynamic> json){
    return ArticleModel(
        description: json['description'],
        publishedAt: json['publishedAt'],
        author: json['author'],
        content: json['content'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        // source: json['source']
        //     !=null? json['source'].runtimeType == String?
        // SourceModel.fromJson(jsonDecode(json['source']))
        //     :
        // SourceModel.fromJson(json['source']): null
    );
  }

  Map<String,dynamic> toJson()=>{
    "description":description,
    "publishedAt":publishedAt,
    "author":author,
    "content":content,
    "title":title,
    "url":url,
    "urlToImage":urlToImage,
    "source":jsonEncode(source)
  };
}
