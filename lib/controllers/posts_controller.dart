import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutterbook/models/post_model.dart';
import 'package:flutterbook/models/user_model.dart';
import 'package:flutterbook/services/api_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await _loadPostsFromApi();
  }

  //Mock User
  UserModel get user => UserModel(
        id: "1",
        name: "Eduardo Azevedo",
        imageUrl:
            "https://avatars.githubusercontent.com/u/49172682?s=400&u=12df3b8878007a0b6f48d7d5d9555cb784191218&v=4",
      );

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  RxList _posts = [].obs;

  List get posts {
    _posts.value.sort((a, b) => b.date.compareTo(a.date));
    return _posts;
  }

  List get myPosts {
    _posts.value.sort((a, b) => b.date.compareTo(a.date));
    return posts.where((element) => element.user.id == user.id).toList();
  }

  _loadPostsFromApi() async {
    _loading.value = true;
    ApiService _apiService = ApiService(Get.find<Dio>());
    _posts.value = await _apiService.getPosts();
    _loading.value = false;
  }

  createPost(String text) {
    var random = new Random();
    var id = random.nextInt(999999) + _posts.length;
    _posts.add(
      PostModel(
        id: "$id",
        answers: 0,
        date: DateTime.now(),
        user: user,
        text: text,
      ),
    );
  }

  editPost(String id, String newText) {
    PostModel post = _posts.singleWhere((element) => element.id == id);
    _posts.remove(post); // Remove post antigo.
    post.text = newText;
    post.date = DateTime.now();
    post.isEdited = true;
    _posts.add(post); // Adiciona post modificado
  }

  deletePost(PostModel post) => _posts.remove(post);
}
