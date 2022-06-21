import 'package:clean_architecture_with_getx/core/params/articles_params.dart';
import 'package:clean_architecture_with_getx/core/resources/data_state.dart';
import 'package:clean_architecture_with_getx/domain/usecases/get_article_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/model/article_model.dart';
import '../../../domain/entities/article.dart';

class RemoteArticleViewController extends GetxController{
  GetArticlesUseCase _getArticlesUseCase;
  RemoteArticleViewController(this._getArticlesUseCase);

  List<ArticleModel>? articles=<ArticleModel>[].obs;
  RxBool moreData=true.obs;
  int _page=1;
  static const int _pageSize=20;

  @override
  void onInit(){
    getBreakingNewsHeadline();
    super.onInit();
  }

  void getBreakingNewsHeadline()async{
    final dataState= await _getArticlesUseCase(params: ArticlesParams(page: _page));
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      final _articles=dataState.data;
      moreData.value=articles!.length<_pageSize;
      articles!.addAll(_articles!);
      _page++;
    }
  }
}