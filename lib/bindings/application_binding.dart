import 'package:dio/dio.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:get/get.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.put(
      PostsController(),
      permanent: true,
    );
  }
}
