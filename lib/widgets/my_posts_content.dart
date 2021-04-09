import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/models/post_model.dart';
import 'package:flutterbook/widgets/post_tile.dart';
import 'package:get/get.dart';

class MyPostsContent extends StatelessWidget {
  final PostsController _postsController;
  MyPostsContent(this._postsController);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _postsController.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _postsController.myPosts.length == 0
              ? Center(
                  child: Text(
                    "Nenhuma postagem efetuada",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _postsController.myPosts.length,
                  itemBuilder: (context, index) {
                    PostModel post = _postsController.myPosts[index];
                    return Stack(
                      children: [
                        PostTile(
                          post,
                          hideUser: true,
                        ),
                        _actions(post),
                      ],
                    );
                  },
                ),
    );
  }

  _actions(PostModel post) => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 5, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text("Excluir postagem"),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Deseja realmente excluir esta postagem?"),
                          SizedBox(height: 10),
                          Text(
                            "Esta ação não poderá ser desfeita.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _postsController.deletePost(post);
                            Get.close(1);
                            Get.snackbar(
                              "Postagem excluída",
                              "Seu post foi excluído com sucesso.",
                              backgroundColor: Colors.green[200],
                            );
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.close(1),
                          child: Text(
                            "Não",
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
}
