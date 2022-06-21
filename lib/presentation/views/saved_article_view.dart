import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/local/database.dart';

class SavedArticleView extends StatelessWidget {
  List<Map<String,Object?>> article;
  SavedArticleView({Key? key,required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db=AppDatabase();
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
         Text('${article}'),
        ],
      ),
      floatingActionButton:
      FloatingActionButton(onPressed: () async{
        List<Map<String,Object?>> article=await db.getAllSavedArticles();
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
