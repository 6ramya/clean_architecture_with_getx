import 'dart:io';

import 'package:clean_architecture_with_getx/core/params/articles_params.dart';
import 'package:clean_architecture_with_getx/core/resources/data_state.dart';
import 'package:clean_architecture_with_getx/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture_with_getx/domain/entities/article.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

import '../datasources/local/database.dart';
import '../model/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService,this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getAllArticles(ArticlesParams params) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsHeadlines(
          country: params.country,
          category: params.category,
          apiKey: params.apiKey,
          pageSize: params.pageSize,
          page: params.page);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataError(DioError(
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage));
    } on DioError catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<int> SaveArticle({ArticleModel? article}) async{
    return _appDatabase.insertArticle(article!);
  }

  @override
  Future<List<Map<String, Object?>>> getSavedArticles() {
    return _appDatabase.getAllSavedArticles();
  }

  @override
  Future<int> deleteArticle(int id) {
    return _appDatabase.deleteArticle(id);
  }
}
