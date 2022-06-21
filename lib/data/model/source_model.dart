import '../../domain/entities/source.dart';

class SourceModel extends Source{
  final Object? id;
  final String? name;

  const SourceModel({this.name,this.id}):
      super(id:id,name:name);

  factory SourceModel.fromJson(Map<String,dynamic> json){
    return SourceModel(
      // id: json['id']!=null?json['id']:null,
      name: json['name']!=null?json['name']:null
    );
  }
}