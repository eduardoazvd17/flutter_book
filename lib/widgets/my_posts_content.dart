import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbook/controllers/posts_controller.dart';
import 'package:flutterbook/models/post_model.dart';
import 'package:flutterbook/widgets/post_tile.dart';
import 'package:get/get.dart';

import 'new_post_modal.dart';

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
                  physics: BouncingScrollPhysics(),
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
          padding: const EdgeInsets.only(top: 2.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: Get.context,
                    builder: (_) => Padding(
                      padding: EdgeInsets.only(
                          bottom: Get.mediaQuery.viewInsets.bottom),
                      child: NewPostModal(
                        Get.find<PostsController>(),
                        editPost: post,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30),
                        topRight: const Radius.circular(30),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  CupertinoIcons.pencil,
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
                              icon: Icon(
                                CupertinoIcons.delete,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.green[200],
                              colorText: Colors.black,
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
                  CupertinoIcons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
}
