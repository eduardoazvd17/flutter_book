import 'package:dio/dio.dart';
import 'package:flutterbook/models/post_model.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<List<PostModel>> getPosts() async {
    try {
      List<PostModel> posts = [];
      String url =
          "https://run.mocky.io/v3/29ca1a88-ec02-44aa-9d26-214983b174a9";
      Response response = await _dio.get(url);
      Map result = response.data as Map;
      for (Map post in result["Result"]) {
        posts.add(PostModel.fromMap(post));
      }
      return posts;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
