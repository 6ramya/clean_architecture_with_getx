import 'package:clean_architecture_with_getx/config/routes/app_route.dart';
import 'package:clean_architecture_with_getx/core/constants.dart';
import 'package:clean_architecture_with_getx/presentation/views/breaking_news_headline.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'config/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      getPages:AppRoutes().pages,
      // [GetPage(name: '/', page: ()=>BreakingNewsHeadline(),binding: HomeBinding()),],
      initialRoute: '/',
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

