import 'package:clean_architecture_with_getx/domain/entities/article.dart';
import 'package:clean_architecture_with_getx/domain/usecases/save_article_usecase.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/get_saved_article_usecase.dart';

class LocalArticleViewController extends GetxController{
  SaveArticleUseCase _saveArticleUseCase;
  GetSavedArticleUseCase _getSavedArticleUseCase;

  LocalArticleViewController(this._saveArticleUseCase,this._getSavedArticleUseCase);

  Future<int> saveArticle(Article? article){
    return _saveArticleUseCase(params:article);
  }

  Future<List<Map<String,Object?>>> getSavedArticles(){
    return _getSavedArticleUseCase();
  }
}