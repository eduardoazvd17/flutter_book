import 'package:dio/dio.dart';
import 'package:flutterbook/core/controllers/posts_controller.dart';
import 'package:flutterbook/core/repositories/api_repository.dart';
import 'package:get/get.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => ApiRepository(Get.find<Dio>()));
    Get.put(
      PostsController(Get.find<ApiRepository>()),
      permanent: true,
    );
  }
}
