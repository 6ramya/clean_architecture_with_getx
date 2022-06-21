import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';

import '../../core/usecase.dart';

class DeleteArticleUseCase implements UseCase<int,int>{
  ArticleRepository _articleRepository;

  DeleteArticleUseCase(this._articleRepository);

  @override
  Future<int> call({int? params}) {
    return _articleRepository.deleteArticle(params!);
  }

}