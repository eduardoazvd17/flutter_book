import 'package:dio/dio.dart';
import 'package:flutterbook/features/home_page/models/post_model.dart';

class ApiRepository {
  final Dio _dio;
  ApiRepository(this._dio);

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
