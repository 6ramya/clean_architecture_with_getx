import 'package:clean_architecture_with_getx/core/constants.dart';

class ArticlesParams {
  final String? country;
  final String? category;
  final String? apiKey;
  final int? page;
  final int? pageSize;

  ArticlesParams({
    this.country='us',
    this.category='general',
    this.apiKey=kApiKey,
    this.pageSize=20,
    this.page=1
  });
}
