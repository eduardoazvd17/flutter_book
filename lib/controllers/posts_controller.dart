import 'package:dio/dio.dart';
import 'package:flutterbook/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    posts.value = await _apiService.getPosts();
  }

  ApiService _apiService = ApiService(Get.find<Dio>());
  RxList posts = [].obs;
}
