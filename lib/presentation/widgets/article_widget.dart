import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  _buildImage(article,context),
                  Expanded(
                      child: Text(
                        '${article.title}',
                      ))
                ],
              )),
        ),
      );
  }
  Widget _buildImage(Article article,BuildContext context){
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
