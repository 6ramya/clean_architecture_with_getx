import '../../domain/entities/source.dart';

class SourceModel extends Source{
  final dynamic id;
  final String? name;

  const SourceModel({this.name,this.id}):
      super(id:id,name:name);

  factory SourceModel.fromJson(Map<String,dynamic> json){
    return SourceModel(
      id: json['id'],
      name: json['name']
    );
  }
}