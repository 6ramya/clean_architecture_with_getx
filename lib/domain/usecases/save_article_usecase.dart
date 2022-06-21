import 'package:clean_architecture_with_getx/core/usecase.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';

import '../entities/article.dart';

class SaveArticleUseCase implements UseCase<int,Article>{
  ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<int> call({Article? params}) {
    return _articleRepository.SaveArticle(article: params!);
  }


}