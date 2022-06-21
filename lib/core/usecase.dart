abstract class UseCase<T,P>{
  Future<T> call({P params});
}

class DataUseCase implements UseCase<String,int>{
  Future<String> call({int? params})async{
    return '${params}';
  }
}

var dataUseCase=DataUseCase();
var data=dataUseCase(params: 10);