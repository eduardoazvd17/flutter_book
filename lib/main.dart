import 'package:flutter/material.dart';
import 'package:flutterbook/bindings/application_binding.dart';
import 'package:flutterbook/bindings/home_binding.dart';
import 'package:flutterbook/utils/application_routes.dart';
import 'package:flutterbook/views/home_page.dart';
import 'package:get/get.dart';

import 'controllers/navigation_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _lightTheme = ThemeData(
    primarySwatch: Colors.orange,
  );
  final _darkTheme = ThemeData.dark();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterBook',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      initialRoute: ApplicationRoutes.HOME,
      initialBinding: ApplicationBinding(),
      getPages: [
        GetPage(
          name: ApplicationRoutes.HOME,
          page: () => HomePage(Get.find<NavigationController>()),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
