import 'package:clean_architecture_with_getx/data/datasources/local/database.dart';
import 'package:clean_architecture_with_getx/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture_with_getx/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture_with_getx/domain/repositories/article_repository.dart';
import 'package:clean_architecture_with_getx/domain/usecases/get_article_usecase.dart';
import 'package:clean_architecture_with_getx/domain/usecases/get_saved_article_usecase.dart';
import 'package:clean_architecture_with_getx/domain/usecases/save_article_usecase.dart';
import 'package:clean_architecture_with_getx/presentation/controller/local_article/local_article_controller.dart';
import 'package:clean_architecture_with_getx/presentation/controller/remote_article/remote_article_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies(){
    final dio=Get.put<Dio>(Dio());
    final newsApiService=Get.put<NewsApiService>(NewsApiService(dio));
    final _appDatabase=Get.put<AppDatabase>(AppDatabase());
    final articleRepo=Get.put<ArticleRepositoryImpl>(ArticleRepositoryImpl(newsApiService,_appDatabase));
    final articleUseCase=Get.put<GetArticlesUseCase>(GetArticlesUseCase(articleRepo));
    final saveArticleUseCase=Get.put<SaveArticleUseCase>(SaveArticleUseCase(articleRepo));
    final getSavedArticleUseCase=Get.put<GetSavedArticleUseCase>(GetSavedArticleUseCase(articleRepo));
    Get.put<RemoteArticleViewController>(RemoteArticleViewController(articleUseCase));
    Get.put<LocalArticleViewController>(LocalArticleViewController(saveArticleUseCase,getSavedArticleUseCase));
  }
}