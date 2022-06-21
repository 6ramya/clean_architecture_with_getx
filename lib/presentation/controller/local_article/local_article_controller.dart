import 'package:clean_architecture_with_getx/domain/entities/article.dart';
import 'package:clean_architecture_with_getx/domain/usecases/save_article_usecase.dart';
import 'package:get/get.dart';

import '../../../data/model/article_model.dart';
import '../../../domain/usecases/deleteArticleUseCase.dart';
import '../../../domain/usecases/get_saved_article_usecase.dart';

class LocalArticleViewController extends GetxController{
  SaveArticleUseCase _saveArticleUseCase;
  GetSavedArticleUseCase _getSavedArticleUseCase;
  DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticleViewController(this._saveArticleUseCase,this._getSavedArticleUseCase,this._deleteArticleUseCase);

  List<Map<String,Object?>> article=<Map<String,Object?>>[].obs;

  Future<int> saveArticle(ArticleModel? article){
    return _saveArticleUseCase(params:article);
  }

  Future<List<Map<String,Object?>>> getSavedArticles()async{
    List<Map<String,Object?>> articles=await _getSavedArticleUseCase();
    // if(articles.isNotEmpty){
      article=articles;
    // }
    return article;
  }

  Future<int> deleteArticle(int id)async{
    print('article deleted');
    return await _deleteArticleUseCase(params: id);
  }
}