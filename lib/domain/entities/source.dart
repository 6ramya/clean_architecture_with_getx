import 'package:equatable/equatable.dart';

class Source extends Equatable{
  final dynamic id;
  final String? name;

  const Source({this.id,this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

  factory Source.fromJson(Map<String,dynamic> json){
    return Source(
      id: json['id'],
      name: json['name']
    );
  }

  Map<String,dynamic> toJson()=>{
    "id":id,
    "name":name
  };
}