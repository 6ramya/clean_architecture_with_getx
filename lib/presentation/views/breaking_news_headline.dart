import 'package:clean_architecture_with_getx/data/datasources/local/database.dart';
import 'package:clean_architecture_with_getx/presentation/controller/local_article/local_article_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../domain/entities/article.dart';
import '../controller/remote_article/remote_article_controller.dart';

class BreakingNewsHeadline extends StatefulWidget {
  const BreakingNewsHeadline({Key? key}) : super(key: key);

  @override
  State<BreakingNewsHeadline> createState() => _BreakingNewsHeadlineState();
}

class _BreakingNewsHeadlineState extends State<BreakingNewsHeadline> {
  final RemoteArticleViewController controller = Get.find();
  final LocalArticleViewController localController=Get.find();
  ScrollController scrollController = ScrollController();
  String message = '';
  final db=AppDatabase();

  @override
  void initState() {
    scrollController.addListener(pagination);
    super.initState();
  }

  pagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      controller.getBreakingNewsHeadline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
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
      actions:[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: IconButton(icon: const Icon(Icons.bookmark), onPressed: () {
            // Get.toNamed('/saveArticle',arguments: localController.getSavedArticles());
          },
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Obx(() => ListView(
          controller: scrollController,
          children: [
            ...List<Widget>.from(controller.articles!
                .map((e) => Builder(builder: (context) => _buildArticle(e)))),
            if (controller.moreData.value) ...[
              const Center(child: CircularProgressIndicator())
            ] else ...[
              const SizedBox()
            ]
          ],
        ));
  }

  Widget _buildArticle(Article article) {
    return
      GestureDetector(
        onTap: ()=>_onTap(article),
        child: Container(
        height: MediaQuery.of(context).size.width / 3,
        color: Colors.grey[600],
        child: Card(
          elevation: 3,
          borderOnForeground: true,
          color: Colors.teal[50],
          // surfaceTintColor: Colors.yellow,
          // shadowColor: Colors.blue,
            shape: const RoundedRectangleBorder(side:BorderSide(color: Colors.teal)),
            margin: const EdgeInsets.all(3),
            child: Row(
              children: [
                _buildImage(article),
                Expanded(
                    child: Text(
                  '${article.title}',
                ))
              ],
            )),
    ),
      );
  }

  Widget _buildImage(Article article){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Container(
          height: double.maxFinite,
          width: MediaQuery.of(context).size.width / 2.8,
          child: Image.network(
            '${article.urlToImage}',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)),
                  child: const Center(
                      child: Text(
                        '404\n Not Found',
                        textAlign: TextAlign.center,
                      )));
            },
          ),
        ),
      ),
    );
  }

  void _onTap(Article article){
    Get.toNamed('/articleDetail',arguments:article);
  }
}
