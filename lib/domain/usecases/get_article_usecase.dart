import 'package:clean_architecture_with_getx/core/params/articles_params.dart';
import 'package:clean_architecture_with_getx/core/usecase.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';

import '../../core/resources/data_state.dart';
import '../entities/article.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesParams> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call({ArticlesParams? params}) async {
    return _articleRepository.getAllArticles(params!);
  }
}
