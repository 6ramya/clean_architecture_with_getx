import 'package:clean_architecture_with_getx/core/params/articles_params.dart';

import '../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<Article>>> getAllArticles(ArticlesParams params);

  Future<int> SaveArticle({Article? article});

  Future<List<Map<String,Object?>>> getSavedArticles();
}