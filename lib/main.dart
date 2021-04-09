import 'package:flutter/material.dart';
import 'package:flutterbook/bindings/application_binding.dart';
import 'package:flutterbook/bindings/home_binding.dart';
import 'package:flutterbook/utils/application_routes.dart';
import 'package:flutterbook/views/home_page.dart';
import 'package:get/get.dart';

import 'controllers/navigation_controller.dart';
import 'controllers/posts_controller.dart';

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
        primarySwatch: Colors.orange,
      ),
      initialRoute: ApplicationRoutes.HOME,
      initialBinding: ApplicationBinding(),
      getPages: [
        GetPage(
          name: ApplicationRoutes.HOME,
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
