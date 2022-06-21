import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:clean_architecture_with_getx/core/constants.dart';
import 'package:clean_architecture_with_getx/data/model/news_model.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl:kBaseUrl)
abstract class NewsApiService{
  factory NewsApiService(Dio dio, {String? baseUrl})=_NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<NewsModel>> getBreakingNewsHeadlines({
  @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize
});
}