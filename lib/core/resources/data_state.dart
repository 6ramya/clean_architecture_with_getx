import 'package:dio/dio.dart';

abstract class DataState<T>{
  final DioError? error;
  final T? data;

  const DataState({this.error,this.data});
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T data):super(data:data);
}

class DataError<T> extends DataState<T>{
  const DataError(DioError error):super(error: error);
}