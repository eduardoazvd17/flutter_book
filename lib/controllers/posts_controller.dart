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

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  RxList _posts = [].obs;
  List get posts => _posts;

  _loadPostsFromApi() async {
    _loading.value = true;
    ApiService _apiService = ApiService(Get.find<Dio>());
    _posts.value = await _apiService.getPosts();
    _loading.value = false;
  }
}
