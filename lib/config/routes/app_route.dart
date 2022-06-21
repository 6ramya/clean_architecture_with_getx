import 'package:clean_architecture_with_getx/config/bindings.dart';
import 'package:clean_architecture_with_getx/presentation/views/article_detail_view.dart';
import 'package:clean_architecture_with_getx/presentation/views/breaking_news_headline.dart';
import 'package:clean_architecture_with_getx/presentation/views/saved_article_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes{
  List<GetPage> pages=[
    GetPage(name: '/', page: ()=>BreakingNewsHeadline(),binding: HomeBinding()),
    GetPage(name: '/articleDetail', page: ()=>ArticleDetailView(article: Get.arguments,)),
    GetPage(name: '/saveArticle', page: ()=>SavedArticleView(article: Get.arguments,))
  ];

}