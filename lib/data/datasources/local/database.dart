import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/constants.dart';
import '../../../domain/entities/article.dart';
import '../../model/article_model.dart';

class AppDatabase{
  static final AppDatabase _instance=AppDatabase._();
  static Database? _database;

  AppDatabase._();

  factory AppDatabase(){
    return _instance;
  }

  Future<Database> get db async{
    if(_database!=null){
      return _database!;
    }
    _database=await init();
    return _database!;
  }

  Future<Database> init()async{
    Directory directory=await getApplicationDocumentsDirectory();
    String dbPath=join(directory.path,kDatabaseName);
    var database=openDatabase(dbPath,version:1,onCreate: _onCreate);
    return database;
  }

  void _onCreate(Database db, int version){
    db.execute('''
    CREATE TABLE $kTableName(id INTEGER PRIMARY KEY AUTOINCREMENT,
    source TEXT NOT NULL, author TEXT, title TEXT, description TEXT,
    url TEXT, urlToImage TEXT, publishedAt TEXT, content TEXT
    )
    ''');

    print('database created');
  }

  Future<int> insertArticle(Article article)async{
    var database=await db;
    print('inserted');
    return database.insert(kTableName, article.toJson());
  }

  Future<List<Map<String,Object?>>> getAllSavedArticles() async{
    var database=await db;
    List<Map<String,Object?>> articles=
    await database.rawQuery('SELECT * FROM $kTableName');
    return articles;
  }










}