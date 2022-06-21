import 'package:clean_architecture_with_getx/core/usecase.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';

import '../../data/model/article_model.dart';
import '../entities/article.dart';

class SaveArticleUseCase implements UseCase<int,ArticleModel>{
  ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<int> call({ArticleModel? params}) {
    return _articleRepository.SaveArticle(article: params!);
  }


}