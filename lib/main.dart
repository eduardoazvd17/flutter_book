import 'package:flutter/material.dart';
import 'package:flutterbook/core/bindings/application_binding.dart';
import 'package:get/get.dart';

import 'core/controllers/posts_controller.dart';
import 'features/home_page/bindings/home_binding.dart';
import 'features/home_page/controllers/navigation_controller.dart';
import 'features/home_page/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterBook',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
      ),
      initialRoute: HomePage.routeName,
      initialBinding: ApplicationBinding(),
      getPages: [
        GetPage(
          name: HomePage.routeName,
          page: () => HomePage(
            Get.find<NavigationController>(),
            Get.find<PostsController>(),
          ),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
