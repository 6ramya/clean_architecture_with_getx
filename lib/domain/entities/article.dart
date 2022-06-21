import 'dart:convert';

import 'package:clean_architecture_with_getx/domain/entities/source.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int? id;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
      this.id,
      this.publishedAt,
      this.description,
      this.title,
      this.urlToImage,
      this.content,
      this.url,
      this.author,
      this.source});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        source,
        description,
        url,
        urlToImage,
        title,
        publishedAt,
        content,
        author
      ];

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
