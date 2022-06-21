import 'package:clean_architecture_with_getx/core/usecase.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<Map<String,Object?>>, void>{
  ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<Map<String, Object?>>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }

}