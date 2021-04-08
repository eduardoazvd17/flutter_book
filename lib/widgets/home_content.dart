import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/models/post_model.dart';
import 'package:get/get.dart';

class HomeContent extends StatelessWidget {
  final PostsController _postsController;
  HomeContent(this._postsController);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _postsController.posts.length,
        itemBuilder: (context, index) {
          PostModel post = _postsController.posts[index];
          return ListTile(
            title: Text(post.id),
          );
        },
      ),
    );
  }
}
