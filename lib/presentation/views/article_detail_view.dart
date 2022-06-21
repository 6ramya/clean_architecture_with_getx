import 'package:clean_architecture_with_getx/data/datasources/local/database.dart';
import 'package:clean_architecture_with_getx/presentation/controller/local_article/local_article_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/article_model.dart';
import '../../domain/entities/article.dart';

class ArticleDetailView extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalArticleViewController controller=Get.find();
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Image.network("${article.urlToImage}"),
          Text('${article.description}')
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            controller.saveArticle(article);
          }, child: Icon(Icons.bookmark)),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      centerTitle: true,
      title: const Text(
        'Daily news',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
