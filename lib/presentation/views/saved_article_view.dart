import 'package:clean_architecture_with_getx/presentation/widgets/article_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/datasources/local/database.dart';
import '../../data/model/article_model.dart';
import '../../domain/entities/article.dart';
import '../controller/local_article/local_article_controller.dart';

class SavedArticleView extends StatelessWidget {
  SavedArticleView({Key? key}) : super(key: key);

  final LocalArticleViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: controller.article.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: ValueKey<int>(
                              int.parse('${controller.article[index]['id']}')),
                          background: Container(color: Colors.red),
                          onDismissed: (DismissDirection direction) {
                            controller.deleteArticle(int.parse(
                                '${controller.article[index]['id']}'));
                            controller.getSavedArticles();
                          },
                          child: ArticleWidget(
                              article: ArticleModel.fromJson(
                                  controller.article[index])));
                    }))
          ],
        ));
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
