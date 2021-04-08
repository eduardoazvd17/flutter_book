import 'package:dio/dio.dart';
import 'package:flutterbook/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await _loadPostsFromApi();
  }

  RxBool loading = false.obs;
  RxList posts = [].obs;

  _loadPostsFromApi() async {
    loading.value = true;
    ApiService _apiService = ApiService(Get.find<Dio>());
    posts.value = await _apiService.getPosts();
    loading.value = false;
  }
}
