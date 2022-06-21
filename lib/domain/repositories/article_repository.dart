import 'package:clean_architecture_with_getx/core/params/articles_params.dart';

import '../../core/resources/data_state.dart';
import '../../data/model/article_model.dart';
import '../entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleModel>>> getAllArticles(ArticlesParams params);

  Future<int> SaveArticle({ArticleModel? article});

  Future<List<Map<String,Object?>>> getSavedArticles();

  Future<int> deleteArticle(int id);
}